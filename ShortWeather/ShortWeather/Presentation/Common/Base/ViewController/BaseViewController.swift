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
    
    private let sideMenuView: SideMenuView = SideMenuView()
    private let backgroundView: UIView = UIView()
    private let tapBackgroundViewGesture: UITapGestureRecognizer = UITapGestureRecognizer()
    public let hamburgerButton: UIButton = UIButton()
    public let viewTitleLabel: UILabel = UILabel()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
    }
}

extension BaseViewController {

    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = Color.white
        
        navigationController?.navigationBar.isHidden = true
        
        backgroundView.do {
            $0.isHidden = true
            $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
            $0.addGestureRecognizer(tapBackgroundViewGesture)
        }
        
        hamburgerButton.do {
            $0.setImage(Image.icnHamburgermenu, for: .normal)
        }
        
        viewTitleLabel.do{
            $0.font = .fontGuide(.subhead2)
            $0.textColor = Color.black
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(hamburgerButton, viewTitleLabel, backgroundView, sideMenuView)
        
        let sideMenuViewWidth = CGFloat(263).adjusted
        
        hamburgerButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(18)
            $0.width.height.equalTo(44)
        }
        
        viewTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(hamburgerButton)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        sideMenuView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(sideMenuViewWidth)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(-sideMenuViewWidth)
        }
        
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        hamburgerButton.addTarget(self, action: #selector(showSideMenuView), for: .touchUpInside)
        tapBackgroundViewGesture.addTarget(self, action: #selector(hideSideMenuView))
    }
    
    // MARK: - @objc Methods
    
    @objc private func showSideMenuView() {
        view.bringSubviewToFront(backgroundView)
        view.bringSubviewToFront(sideMenuView)
        UIView.animate(withDuration: 0.5) {
            self.sideMenuView.snp.updateConstraints {
                $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading)
            }
            self.view.layoutIfNeeded()
        }
        backgroundView.isHidden = false
    }
    
    @objc private func hideSideMenuView() {
        let sideMenuViewWidth = CGFloat(263).adjusted
        self.backgroundView.isHidden = true
        UIView.animate(withDuration: 0.5) {
            self.sideMenuView.snp.updateConstraints {
                $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(-sideMenuViewWidth)
            }
            self.view.layoutIfNeeded()
        }
    }
}

