//
//  TimeViewController.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/05.
//

import UIKit

import Moya
import SnapKit
import Then

protocol TimeInfoViewControllerDelegate: AnyObject {
    func getNullData()
    func getInfoData(userInfoData: UserInfo, numTime: String)
}

final class TimeInfoViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = UILabel()
    let datePicker: UIPickerView = UIPickerView()
    private let saveButton: CheckButton = CheckButton()
    
    // MARK: - Properties
    
    public weak var delegate: TimeInfoViewControllerDelegate?
    private var titleText: String
    private let infoType: InfoType
    private var dayTime: String = ""
    private var hourTime: Int = 0
    private var minuteTime: String = ""
    private var stringTime: String = ""
    private let dayTimeList: [String] = ["오전", "오후"]
    private let hourTimeList: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    private let minuteTimeList: [String] = ["00"]
    private let wakeUpTimeList: [String] = ["00", "30"]
    
    // MARK: - Initializer
    
    init(infoText: String, infoType: InfoType) {
        self.titleText = infoText
        self.infoType = infoType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        resetTime()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.getNullData()
    }
}

extension TimeInfoViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        titleLabel.do {
            $0.text = titleText
            $0.font = .fontGuide(.headline2)
            $0.textColor = Color.black
        }
        
        datePicker.do {
            $0.delegate = self
            $0.dataSource = self
        }
        
        saveButton.do {
            $0.setTitle("저장", for: .normal)
            $0.setState(.allow)
            $0.addTarget(self, action: #selector(saveButtonDidTap), for: .touchUpInside)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(titleLabel, datePicker, saveButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(41)
            $0.leading.equalToSuperview().offset(28)
        }
        
        datePicker.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-27)
            $0.height.equalTo(101)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(datePicker.snp.bottom).offset(75)
            $0.leading.equalTo(datePicker)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(57)
        }
    }
    
    // MARK: - Methods
    
    private func resetTime() {
        switch infoType {
        case .wakeUpTime:
            dayTime = "오전"
            hourTime = 7
            minuteTime = "00"
        case .outTime:
            dayTime = "오전"
            hourTime = 8
            minuteTime = "00"
        case .inTime:
            dayTime = "오후"
            hourTime = 6
            minuteTime = "00"
        default:
            print("error")
        }
    }
    
    private func timeToString(dayTime: String, hourTime: Int, minuteTime: String) -> String {
        var stringTime: String = ""
        if dayTime == "오전" && hourTime < 10 {
            stringTime = "0" + String(hourTime) + minuteTime
        }
        else if dayTime == "오전" && hourTime >= 10 {
            stringTime = String(hourTime) + minuteTime
        }
        else if dayTime == "오후" && hourTime == 12 {
            stringTime = "0000"
        }
        else if dayTime == "오후" {
            stringTime = String(hourTime + 12) + minuteTime
        }
        print(stringTime)
        return stringTime
    }
    
    // MARK: - @objc Methods
    
    @objc private func saveButtonDidTap() {
        stringTime = dayTime + " " + String(hourTime) + "시 " + minuteTime + "분"
        let numTime = timeToString(dayTime: dayTime, hourTime: hourTime, minuteTime: minuteTime)
        delegate?.getInfoData(userInfoData: UserInfo(infoData: stringTime, infoType: infoType), numTime: numTime)
        self.dismiss(animated: true)
    }
}

//MARK: - UIPickerViewDataSource

extension TimeInfoViewController: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return dayTimeList.count
        case 1:
            return hourTimeList.count
        default:
            if infoType == .wakeUpTime {
                return wakeUpTimeList.count
            }
            else {
                return minuteTimeList.count
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            dayTime = dayTimeList[row]
        case 1:
            hourTime = hourTimeList[row]
        default:
            if infoType == .wakeUpTime {
                minuteTime = wakeUpTimeList[row]
            }
            else {
                minuteTime = minuteTimeList[row]
            }
        }
        stringTime = dayTime + " " + String(hourTime) + "시 " + minuteTime + "분"
    }
}

//MARK: - UIPickerViewDelegate

extension TimeInfoViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return dayTimeList[row]
        case 1:
            return "\(hourTimeList[row])"
        default:
            if infoType == .wakeUpTime {
                return wakeUpTimeList[row]
            }
            else {
                return minuteTimeList[row]
            }
        }
    }
}
