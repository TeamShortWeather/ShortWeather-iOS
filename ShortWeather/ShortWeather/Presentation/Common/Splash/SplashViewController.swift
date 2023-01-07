//
//  SplashViewController.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/01.
//

import UIKit

import Lottie
import SnapKit
import Then

final class SplashViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let splashImageView: LottieAnimationView = LottieAnimationView(name: "splash")
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension SplashViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(splashImageView)
        
//        splashImageView.backgroundColor = .red
        splashImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.play { [weak self] _ in
                self?.isExistInform()
            }
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        splashImageView.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.width.equalTo(CGFloat(108).adjusted)
            $0.height.equalTo(CGFloat(153).adjusted)
        }
    }
    
    // MARK: - Methods
    
    private func isExistInform(){
        let isUser: Bool = true
        if isUser {
            UIViewController.modifyRootViewController(TodayWeatherViewController())
        } else {
            UIViewController.modifyRootViewController(FirstInfoViewController())
        }
    }
}
