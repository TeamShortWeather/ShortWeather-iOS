//
//  WakeUpTimeViewController.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/06.
//

import UIKit

import SnapKit
import Then

final class WakeUpTimeViewController: UIViewController {
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension WakeUpTimeViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Image.icnExpandLeft,
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(backButtonDidTap))
        navigationItem.leftBarButtonItem?.tintColor = Color.black
        navigationItem.title = "기상시간 설정"
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
    
    // MARK: - Methods
    
    private func popToSettingViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - @objc Methods
    
    @objc private func backButtonDidTap() {
        popToSettingViewController()
    }
}
