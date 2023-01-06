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
    private let allAlarmView: UIView = UIView()
    private let allAlarmLabel: UILabel = UILabel()
    private let allAlarmDescriptionLabel: UILabel = UILabel()
    private lazy var allAlarmLabelStackView: UIStackView = UIStackView()
    @objc private let allAlarmSwitchButton: UISwitch = UISwitch()
    private lazy var alarmTableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Properties
    
    var alarmSettingList: [AlarmSetting] = [AlarmSetting(title: "기상시간대 알림", description: "기상시간에 맞춰서 날씨를 알려드려요", isOn: true),
                                            AlarmSetting(title: "취침시간대 알림", description: "취침시간에 맞춰서 날씨를 알려드려요", isOn: false),
                                            AlarmSetting(title: "특보 알림", description: "실시간 날씨 특보를 알려드려요", isOn: false)]
    
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

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Image.icnExpandLeft, style: .plain, target: self, action: #selector(backButtonDidTap))
        navigationItem.leftBarButtonItem?.tintColor = Color.black
        navigationItem.title = "알림 설정"
        
        titleLabel.do {
            $0.text = "알림 받을 시간대를\n설정해주세요"
            $0.numberOfLines = 0
            $0.font = .fontGuide(.headline1)
        }
        
        allAlarmLabel.do {
            $0.text = "전체 알림"
            $0.font = .fontGuide(.subhead2)
        }
        
        allAlarmDescriptionLabel.do {
            $0.text = "날씨 정보를 알려드려요"
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
        view.addSubviews(titleLabel, allAlarmView, alarmTableView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(28)
            $0.leading.equalToSuperview().offset(28)
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
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setAddTarget() {
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
    
    @objc private func backButtonDidTap() {
        popToSettingViewController()
    }
    
    @objc private func allAlarmButtonDidTap() {
        checkAlarmOn()
    }
}

// MARK: - UITableViewDataSource

extension AlarmSettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmSettingList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: AlarmTableViewCell.self, indexPath: indexPath)
        cell.dataBind(alarmSettingList[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension AlarmSettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(88)
    }
}
