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

protocol TimeViewControllerDelegate: AnyObject {
    func sendData(pickData: String, listType: SecondInfoType)
}

final class TimeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = UILabel()
    private let datePicker: UIDatePicker = UIDatePicker()
    private let saveButton: UIButton = UIButton()
    
    // MARK: - Properties
    
    private let listType: SecondInfoType
    private var titleText: String
    public weak var delegate: TimeViewControllerDelegate?
    
    // MARK: - Initializer
    
    init(titleText: String, listType: SecondInfoType) {
        self.titleText = titleText
        self.listType = listType
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

extension TimeViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        titleLabel.do {
            $0.text = titleText
            $0.font = .fontGuide(.headline1)
            $0.textColor = .black
        }
        
        datePicker.do {
            $0.datePickerMode = UIDatePicker.Mode.time
            $0.preferredDatePickerStyle = .wheels
            $0.backgroundColor = UIColor.white
            $0.locale = Locale(identifier: "ko-KR")
            $0.minuteInterval = 30
        }
        
        saveButton.do {
            $0.setTitle("저장", for: .normal)
            $0.setTitleColor(Color.white, for: .normal)
            $0.backgroundColor = Color.pointColor
            $0.layer.cornerRadius = 15
            $0.addTarget(self, action: #selector(backButton), for: .touchUpInside)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(titleLabel, datePicker, saveButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(41)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(319)
        }
        
        datePicker.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(320)
            $0.height.equalTo(101)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(200)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(320)
            $0.height.equalTo(57)
        }
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButton() {
        let timeFormatter = DateFormatter()
//        timeFormatter.timeStyle = .short
        timeFormatter.timeStyle = .none
        timeFormatter.dateFormat = "hh시 mm분" // 서버전달 방식 (근데오후가 없네)
        let strDate = timeFormatter.string(from: datePicker.date) // String으로 변환
        print(strDate)
        delegate?.sendData(pickData: strDate, listType: listType)
        self.dismiss(animated: true, completion: nil)
    }
}
