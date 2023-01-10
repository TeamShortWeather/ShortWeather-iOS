//
//  SideMenuView.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/01.
//

import UIKit

final class SideMenuView: UIView {
    
    // MARK: - UI Components
    
    private let logoTextImageView: UIImageView = UIImageView()
    private let closeButton: UIButton = UIButton()
    private let menuLabel: UILabel = UILabel()
    private let menuTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: - UI Components
    
    private let menuIcons: [UIImage?] = [Image.icnToday, Image.icnWeek, Image.icnCloth, Image.icnSetting]
    private let menuTexts: [String] = [Letter.todayWeather, Letter.weekWeather, Letter.cloth, Letter.setting]
    
    // MARK: - Initializer
    
    init() {
        super.init(frame: .zero)
        setUI()
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SideMenuView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 20
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            return tableView.dequeueReusableView(type: MenuLineHeaderView.self)
        }
        return UIView()
    }
}

extension SideMenuView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? menuIcons.count-1 : 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueCell(type: MenuTableViewCell.self, indexPath: indexPath)
        if indexPath.section == 0 {
            cell.setDataBind(menuImage: menuIcons[indexPath.row]!, menuText: menuTexts[indexPath.row])
        } else {
            cell.setDataBind(menuImage: menuIcons[menuIcons.count-1]!, menuText: menuTexts[menuIcons.count-1])
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                UIViewController.modifyRootViewController(TodayWeatherViewController())
            case 1:
                UIViewController.modifyRootViewController(WeekWeatherViewController())
            case 2:
                UIViewController.modifyRootViewController(TodayWeatherViewController())
            default:
                UIViewController.modifyRootViewController(TodayWeatherViewController())
            }
        } else {
            UIViewController.modifyRootViewController(SettingViewController())
        }
    }
}

extension SideMenuView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        backgroundColor = Color.white
        
        logoTextImageView.do {
            $0.image = Image.logoText
        }
        
        menuLabel.do {
            $0.text = "메뉴"
            $0.font = .fontGuide(.subhead2)
            $0.textColor = Color.gray6
        }
        
        menuTableView.do {
            $0.backgroundColor = Color.white
            $0.separatorStyle = .none
            $0.isScrollEnabled = false
            $0.registerCell(MenuTableViewCell.self)
            $0.registerReusableView(MenuLineHeaderView.self)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(logoTextImageView, closeButton, menuLabel, menuTableView)
        
        logoTextImageView.snp.makeConstraints {
            $0.height.equalTo(22)
            $0.width.equalTo(99)
            $0.leading.equalToSuperview().offset(28)
            $0.top.equalToSuperview().offset(64)
        }
        
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(65)
            $0.width.height.equalTo(24)
            $0.trailing.equalToSuperview().offset(17)
        }
        
        menuLabel.snp.makeConstraints {
            $0.top.equalTo(logoTextImageView.snp.bottom).offset(34)
            $0.leading.equalTo(logoTextImageView)
        }
        
        menuTableView.snp.makeConstraints {
            $0.top.equalTo(menuLabel.snp.bottom).offset(6)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    private func setDelegate() {
        menuTableView.dataSource = self
        menuTableView.delegate = self
    }
}
