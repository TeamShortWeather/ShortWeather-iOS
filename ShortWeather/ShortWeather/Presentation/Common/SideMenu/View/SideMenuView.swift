//
//  SideMenuView.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/01.
//

import UIKit

final class SideMenuView: UIView {
    
    // MARK: - UI Components
    
    private let logoIconImageView: UIImageView = UIImageView()
    private let logoTextImageView: UIImageView = UIImageView()
    private let closeButton: UIButton = UIButton()
    private let menuLabel: UILabel = UILabel()
    private let menuTableView: UITableView = UITableView(frame: .zero, style: .grouped)
//    private let menuTableView: UITableView = UITableView()
    
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
        switch indexPath.row {
        case 0:
            UIViewController.modifyRootViewController(TodayWeatherViewController())
        case 1:
            UIViewController.modifyRootViewController(TodayWeatherViewController())
        case 2:
            UIViewController.modifyRootViewController(TodayWeatherViewController())
        case 3:
            UIViewController.modifyRootViewController(TodayWeatherViewController())
        default:
            UIViewController.modifyRootViewController(TodayWeatherViewController())
        }
    }
}

extension SideMenuView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        backgroundColor = .red
        logoIconImageView.do {
            $0.image = Image.logoIcon
        }
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
        addSubviews(logoIconImageView, logoTextImageView, closeButton, menuLabel, menuTableView)
        logoIconImageView.snp.makeConstraints {
            $0.width.height.equalTo(36)
            $0.leading.equalToSuperview().offset(28)
            $0.top.equalToSuperview().offset(52)
        }
        logoTextImageView.snp.makeConstraints {
            $0.bottom.equalTo(logoIconImageView)
            $0.height.equalTo(20)
            $0.width.equalTo(59)
            $0.leading.equalTo(logoIconImageView.snp.trailing).offset(8)
        }
        closeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(63)
            $0.width.height.equalTo(29)
            $0.trailing.equalToSuperview().offset(14)
        }
        menuLabel.snp.makeConstraints {
            $0.top.equalTo(logoIconImageView.snp.bottom).offset(32)
            $0.leading.equalTo(logoIconImageView)
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