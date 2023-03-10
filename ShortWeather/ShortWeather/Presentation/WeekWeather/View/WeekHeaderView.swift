//
//  WeekHeaderView.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/09.
//

import UIKit

import Moya
import SnapKit
import Then

class WeekHeaderView: UICollectionReusableView {
    
    // MARK: - UI Components
    
    private let weekDescriptionView: UIView = UIView()
    private let dailyForecastLabel: UILabel = UILabel()
    private let timeZoneLabel: UILabel = UILabel()
    private let temperatureLabel: UILabel = UILabel()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeekWeatherUIView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        dailyForecastLabel.do {
            $0.text = "일별예보"
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray7
        }
        
        timeZoneLabel.do {
            $0.text = "오전 / 오후"
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray7
        }
        
        temperatureLabel.do {
            $0.text = "최저 / 최고"
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray7
        }
        
        weekDescriptionView.do {
            $0.backgroundColor = .clear
        }
        
        weekWeatherCollectionView.do {
            $0.showsVerticalScrollIndicator = false
            $0.registerCells(WeekWeatherCollectionViewCell.self)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(weekDescriptionView)
        weekDescriptionView.addSubviews(dailyForecastLabel, timeZoneLabel, temperatureLabel)
        
        weekDescriptionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(36)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(18)
        }
        
        dailyForecastLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        timeZoneLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        weekWeatherCollectionView.snp.makeConstraints {
            $0.top.equalTo(weekDescriptionView.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(28)
            $0.trailing.equalToSuperview().inset(28)
            $0.bottom.equalToSuperview().offset(20)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        weekWeatherCollectionView.delegate = self
        weekWeatherCollectionView.dataSource = self
    }
    
    // MARK: - @objc Methods
}
