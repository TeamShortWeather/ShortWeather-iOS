//
//  ViewController.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2022/12/23.
//

import UIKit

import Moya
import SnapKit
import Then

class BaseViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let sideMenuView: UIView = UIView()
    private let backgroundView: UIView = UIView()
    private let hamburgerButton: UIButton = UIButton()
    private let addLocationButton: UIButton = UIButton()
    private let viewTitleLabel: UILabel = UILabel()
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDataBind()
    }
}

extension BaseViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = Color.white
        [sideMenuView, backgroundView,hamburgerButton, addLocationButton, viewTitleLabel].forEach {
            view.addSubview($0)
        }
        backgroundView.do {
            $0.isHidden = true
            $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 60)
        }
        hamburgerButton.do {
            $0.setImage(Image.icnHamburgermenu, for: .normal)
        }
        addLocationButton.do {
            $0.setImage(Image.icnAdd, for: .normal)
        }
        viewTitleLabel.do {
            $0.text = "Test Title"
            $0.font = .fontGuide(.subhead2)
        }
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        let sideMenuViewWidth = CGFloat(263).adjusted
        sideMenuView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(sideMenuViewWidth)
            $0.leading.equalToSuperview().offset(-sideMenuViewWidth)
        }
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        hamburgerButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(18)
            $0.width.height.equalTo(44)
        }
        addLocationButton.snp.makeConstraints {
            $0.top.width.height.equalTo(hamburgerButton)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-18)
        }
        viewTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(hamburgerButton)
            $0.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDataBind() {
    }
    
    // MARK: - @objc Methods
}

