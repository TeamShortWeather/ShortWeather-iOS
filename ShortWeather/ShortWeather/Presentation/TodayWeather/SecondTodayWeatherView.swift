//
//  SecondTodayWeatherView.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/02.
//

import UIKit

import SnapKit
import Then

class SecondTodayWeatherView: UIView {
    
    // MARK: - UI Components
    
    private let weatherTableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) { 
        super.init(coder: coder)
    }
}

extension SecondTodayWeatherView {
    
    // MARK: - UI Components
    
    private func setUI() {
        self.backgroundColor = .white
        
        weatherTableView.do {
            $0.backgroundColor = .yellow
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
        }
    }
     
    // MARK: - Layout Helepr
    
    private func setLayout() {
        self.addSubviews(weatherTableView)
        
        weatherTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
}
