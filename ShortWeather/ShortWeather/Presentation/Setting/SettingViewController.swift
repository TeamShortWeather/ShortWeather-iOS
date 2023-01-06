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
        
        settingTableView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .clear
            $0.separatorStyle = .none
            $0.backgroundColor = .yellow
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(settingTableView)
        
        settingTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
}
