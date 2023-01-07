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
    func getInfoData(userInfoData: UserInfo)
}

final class TimeInfoViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = UILabel()
    private let datePicker: UIDatePicker = UIDatePicker()
    private let saveButton: CheckButton = CheckButton()
    
    // MARK: - Properties
    
    private var titleText: String
    public weak var delegate: TimeInfoViewControllerDelegate?
    
    // MARK: - Initializer
    
    init(titleText: String) {
        self.titleText = titleText
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
    }
}

extension TimeInfoViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        titleLabel.do {
            $0.text = titleText
            $0.font = .fontGuide(.headline1)
            $0.textColor = Color.black
        }
        
        datePicker.do {
            $0.backgroundColor = Color.white
            $0.datePickerMode = UIDatePicker.Mode.time
            $0.preferredDatePickerStyle = .wheels
            $0.locale = Locale(identifier: "ko-KR")
            $0.minuteInterval = 30
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
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            $0.leading.equalToSuperview().offset(41)
        }
        
        datePicker.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-28)
            $0.height.equalTo(101)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(datePicker.snp.bottom).offset(75)
            $0.leading.equalTo(datePicker)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(57)
        }
    }
    
    // MARK: - @objc Methods
    
    @objc private func saveButtonDidTap() {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .none
        timeFormatter.dateFormat = "a h시 mm분"
        let strDate = timeFormatter.string(from: datePicker.date)
        timeFormatter.dateFormat = "a"
        let a = timeFormatter.string(from: datePicker.date)
        delegate?.getInfoData(userInfoData: UserInfo(infoData: a, infoType: .wakeUpTime))
        self.dismiss(animated: true, completion: nil)
    }
}
