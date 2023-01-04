//
//  FirstTodayWeatherView.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/04.
//

import UIKit

import Moya
import SnapKit
import Then

final class FirstTodayWeatherView: UIView {

    // MARK: - UI Components
    
    private let compareTempLabel: UILabel = UILabel()
    private let compareWeatherLabel: UILabel = UILabel()
    private let reportCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    private let weatherImageView: UIImageView = UIImageView()
    private let weatherLabel: UILabel = UILabel()
    private let gradationView: UIView = UIView()
    private let lowestTempLabel: UILabel = UILabel()
    private let presentTempLabel: UILabel = UILabel()
    private let highestTempLabel: UILabel = UILabel()
    private let todayWeatherLabel: UILabel = UILabel()
    private let yesterdayWeatherLabel: UILabel = UILabel()
    private let showYesterdayWeatherButton: UIButton = UIButton()
    private let bottomArrowImageView: UIImageView = UIImageView()
    
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FirstTodayWeatherView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        compareTempLabel.do {
            $0.tintColor = Color.mainColor
            $0.textColor = Color.pointColor
            $0.font = .fontGuide(.subhead2)
            // Color.gray7
        }
        compareWeatherLabel.do {
            $0.font = .fontGuide(.display1)
        }
        reportCollectionView.do {
            $0.backgroundColor = .red
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(compareTempLabel, compareWeatherLabel,
                    reportCollectionView, weatherImageView,
                    weatherLabel, gradationView,
                    presentTempLabel, lowestTempLabel,
                    highestTempLabel, todayWeatherLabel,
                    showYesterdayWeatherButton, yesterdayWeatherLabel,
                    bottomArrowImageView)
        compareTempLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(28)
            $0.height.equalTo(22)
        }
        compareWeatherLabel.snp.makeConstraints {
            $0.top.equalTo(compareTempLabel.snp.bottom)
            $0.leading.equalTo(compareTempLabel)
            $0.height.equalTo(41)
        }
        reportCollectionView.snp.makeConstraints {
            $0.top.equalTo(compareWeatherLabel.snp.bottom).offset(8)
            $0.leading.equalTo(compareWeatherLabel)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(26)
        }
        weatherImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(CGFloat(-100).adjusted)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(CGFloat(208).adjusted)
        }
        weatherLabel.snp.makeConstraints {
            $0.top.equalTo(weatherImageView.snp.bottom).offset(2)
            $0.centerX.equalToSuperview()
        }
        gradationView.snp.makeConstraints {
            $0.top.equalTo(weatherImageView).offset(CGFloat(157).adjusted)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        presentTempLabel.snp.makeConstraints {
            $0.top.equalTo(weatherLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        lowestTempLabel.snp.makeConstraints {
            $0.centerY.equalTo(presentTempLabel)
            $0.trailing.equalTo(presentTempLabel.snp.leading).offset(-5)
        }
        highestTempLabel.snp.makeConstraints {
            $0.centerY.equalTo(presentTempLabel)
            $0.leading.equalTo(presentTempLabel.snp.trailing).offset(5)
        }
        todayWeatherLabel.snp.makeConstraints {
            $0.top.equalTo(presentTempLabel.snp.bottom).offset(CGFloat(18).adjusted)
            $0.centerX.equalToSuperview()
        }
        
        showYesterdayWeatherButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(CGFloat(116).adjusted)
            $0.leading.equalToSuperview().offset(28)
            $0.width.height.equalTo(24)
        }
        yesterdayWeatherLabel.snp.makeConstraints {
            $0.centerY.equalTo(showYesterdayWeatherButton)
            $0.leading.equalTo(showYesterdayWeatherButton.snp.trailing).offset(10)
            $0.height.equalTo(60)
        }
        bottomArrowImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(CGFloat(44).adjusted)
            $0.width.height.equalTo(44)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}


