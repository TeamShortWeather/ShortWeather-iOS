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
    
    let sideMenuView: SideMenuView = SideMenuView()
    let backgroundView: UIView = UIView()
    private let tapBackgroundViewGesture: UITapGestureRecognizer = UITapGestureRecognizer()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension BaseViewController {

    // MARK: - UI Components Property
    
    private func setUI() {
        tapBackgroundViewGesture.addTarget(self, action: #selector(hideSideMenuView))
        view.backgroundColor = Color.mainColor
         [backgroundView, sideMenuView].forEach {
            view.addSubview($0)
        }
        
        sideMenuView.backgroundColor = .white
        backgroundView.do {
            $0.isHidden = true
            $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
            $0.addGestureRecognizer(tapBackgroundViewGesture)
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Image.icnHamburgermenu,
                                                                style: .done,
                                                                target: self,
                                                                action: #selector(showSideMenuView))
        navigationItem.title = "오늘 날씨"
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        let sideMenuViewWidth = CGFloat(263).adjusted
        sideMenuView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(sideMenuViewWidth)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(-sideMenuViewWidth)
        }
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - @objc Methods
    
    @objc private func showSideMenuView() {
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

