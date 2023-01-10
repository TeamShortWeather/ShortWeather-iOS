//
//  SettingViewController.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/06.
//

import UIKit

import SnapKit
import Then

final class SettingViewController: BaseViewController {
    
    // MARK: UI Components
    
    private lazy var settingTableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Properties
    
    let settingList: [String] = [Letter.commuteTime, Letter.alarm, Letter.wakeUpTime]
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
    }
}

extension SettingViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        navigationItem.title = "설정"
        
        settingTableView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .clear
            $0.separatorStyle = .none
            $0.isScrollEnabled = false
            $0.registerCell(SettingTableViewCell.self)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(settingTableView)
        
        settingTableView.snp.makeConstraints {
            $0.top.equalTo(hamburgerButton.snp.bottom).offset(22)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        settingTableView.dataSource = self
        settingTableView.delegate = self
    }
}

// MARK: - UITableViewDataSource

extension SettingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: SettingTableViewCell.self, indexPath: indexPath)
        cell.setDataBind("\(settingList[indexPath.row]) 설정")
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SettingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let commuteVC = CommuteTimeViewController()
            navigationController?.pushViewController(commuteVC, animated: true)
        case 1:
            let alarmVC = AlarmSettingViewController()
            navigationController?.pushViewController(alarmVC, animated: true)
        case 2:
            let wakeUpVC = WakeUpTimeViewController()
            navigationController?.pushViewController(wakeUpVC, animated: true)
        default:
            break
        }
    }
}
