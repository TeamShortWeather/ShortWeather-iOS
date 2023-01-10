//
//  AlarmSettingViewController.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/06.
//

import UIKit

import SnapKit
import Then

final class AlarmSettingViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = UILabel()
    private let backButton: UIButton = UIButton()
    private let allAlarmView: UIView = UIView()
    private let allAlarmLabel: UILabel = UILabel()
    private let allAlarmDescriptionLabel: UILabel = UILabel()
    private lazy var allAlarmLabelStackView: UIStackView = UIStackView()
    @objc private let allAlarmSwitchButton: UISwitch = UISwitch()
    private lazy var alarmTableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Properties
    
    var alarmSettingList: [AlarmSetting] = [AlarmSetting(title: "\(Letter.wakeUpTimeAlarm) 설정", description: Letter.wakeUpTimeAlarmDescription, isOn: true),
                                            AlarmSetting(title: "\(Letter.bedtimeAlarm) 설정", description: Letter.bedtimeAlarmDescription, isOn: false),
                                            AlarmSetting(title: "\(Letter.newsAlarm) 설정", description: Letter.newsAlarmDescription, isOn: false)]
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
        setDelegate()
        checkAlarmOn() 
    }
}

extension AlarmSettingViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        backButton.do {
            $0.setImage(Image.icnExpandLeft, for: .normal)
        }
        
        navigationItem.title = "\(Letter.alarm) 설정"
        
        titleLabel.do {
            $0.text = Letter.changeAlarm
            $0.numberOfLines = 0
            $0.font = .fontGuide(.headline1)
        }
        
        allAlarmLabel.do {
            $0.text = Letter.allAlarm
            $0.font = .fontGuide(.subhead2)
        }
        
        allAlarmDescriptionLabel.do {
            $0.text = Letter.allAlarmDescription
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray7
        }
        
        allAlarmLabelStackView.do {
            $0.axis = .vertical
            $0.spacing = 6
        }
        
        allAlarmSwitchButton.do {
            $0.tintColor = Color.pointColor
            $0.onTintColor = Color.pointColor
        }
        
        alarmTableView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .clear
            $0.separatorStyle = .none
            $0.isScrollEnabled = false
            $0.registerCell(AlarmTableViewCell.self)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        allAlarmLabelStackView.addArrangedSubviews(allAlarmLabel, allAlarmDescriptionLabel)
        allAlarmView.addSubviews(allAlarmLabelStackView, allAlarmSwitchButton)
        
        view.addSubviews(backButton, titleLabel, allAlarmView, alarmTableView)
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(28)
            $0.width.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(28)
            $0.leading.equalTo(backButton)
        }
        
        allAlarmLabelStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(28)
            $0.centerY.equalToSuperview()
        }
        
        allAlarmSwitchButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-28)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(63)
            $0.height.equalTo(33)
        }
        
        allAlarmView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(19)
            $0.width.equalToSuperview()
            $0.height.equalTo(88)
        }
        
        alarmTableView.snp.makeConstraints {
            $0.top.equalTo(allAlarmView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func popToSettingViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        allAlarmSwitchButton.addTarget(self, action: #selector(allAlarmButtonDidTap), for: .touchUpInside)
    }
    
    private func setDelegate() {
        alarmTableView.dataSource = self
        alarmTableView.delegate = self
    }
    
    private func checkAlarmOn() {
        if allAlarmSwitchButton.isOn {
            alarmTableView.isHidden = false
        } else {
            alarmTableView.isHidden = true
        }
    }
    
    // MARK: - @objc Methods
    
    @objc private func allAlarmButtonDidTap() {
        checkAlarmOn()
    }
    
    @objc public func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDataSource

extension AlarmSettingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmSettingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: AlarmTableViewCell.self, indexPath: indexPath)
        cell.setDataBind(alarmSettingList[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension AlarmSettingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(88)
    }
}
