//
//  TestViewController.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/02.
//

import UIKit

import SnapKit
import Then

class TestViewController: UIViewController {
    
    private let weatherView = SecondTodayWeatherView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    // MARK: - UI Components
    
    private func setUI() {
        view.backgroundColor = .white
        
    }
    
    // MARK: - Layout Helepr
    
    private func setLayout() {
        view.addSubviews(weatherView)
        
        weatherView.snp.makeConstraints {
            $0.edges.equalToSuperview() 
        }
    }
}
