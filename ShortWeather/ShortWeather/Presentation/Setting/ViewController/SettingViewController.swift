//
//  SettingViewController.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/06.
//

import UIKit

import SnapKit
import Then

class SettingViewController: BaseViewController {
    
    // MARK: UI Components
    
    private lazy var settingTableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Properties
    
    let settingTitle: [SettingTitle] = [SettingTitle(title: "외출 / 귀가시간대 설정"),
                                        SettingTitle(title: "알림 설정"),
                                        SettingTitle(title: "기상시간 설정")]
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
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
            $0.backgroundColor = .clear
            $0.isScrollEnabled = false
            
            $0.registerCell(SettingTableViewCell.self)
            $0.dataSource = self
            $0.delegate = self
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(settingTableView)
        
        settingTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(22)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDataSource

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: SettingTableViewCell.self, indexPath: indexPath)
        cell.dataBind(settingTitle[indexPath.row])
        return cell
    }
}

// MARK: -

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
}
