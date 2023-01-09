//
//  WeekWeatherCollectionViewCell.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/09.
//

import UIKit

import Moya
import SnapKit
import Then

final class WeekWeatherCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let dayWeekLabel: UILabel = UILabel()
    private let dateWeekLabel: UILabel = UILabel()
    private let weekImageView: UIView = UIView()
    private let morningImage: UIImageView = UIImageView()
    private let morningRain: UILabel = UILabel()
    private let morningView: UIView = UIView()
    private let afternoonImage: UIImageView = UIImageView()
    private let afternoonRain: UILabel = UILabel()
    private let afternoonView: UIView = UIView()
    private let minTempLabel: UILabel = UILabel()
    private let maxTempLabel: UILabel = UILabel()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        print("cell")
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeekWeatherCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        contentView.backgroundColor = .clear
        
        dayWeekLabel.do {
            $0.text = "오늘"
            $0.font = .fontGuide(.subhead3)
        }
        
        dateWeekLabel.do {
            $0.text = "12.20"
            $0.font = .fontGuide(.body2)
        }
        
        morningImage.do {
            $0.image = Image.icnSnow
        }
        
        morningRain.do {
            $0.text = "60%"
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray4
        }
        
        afternoonImage.do {
            $0.image = Image.icnFog
        }
        
        afternoonRain.do {
            $0.text = "100%"
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray4
        }
        
        minTempLabel.do {
            $0.text = "-10°"
            $0.font = .fontGuide(.subhead2)
            $0.textColor = Color.gray4
        }
        
        maxTempLabel.do {
            $0.text = "-11°"
            $0.font = .fontGuide(.subhead2)
            $0.textColor = Color.gray7
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(dayWeekLabel, dateWeekLabel, weekImageView, minTempLabel, maxTempLabel)
        weekImageView.addSubviews(morningView, afternoonView)
        morningView.addSubviews(morningImage, morningRain)
        afternoonView.addSubviews(afternoonImage, afternoonRain)
        
        dayWeekLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17)
            $0.leading.equalToSuperview().offset(8)
        }
        
        dateWeekLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-17)
            $0.leading.equalTo(dayWeekLabel.snp.leading)
        }
        
        weekImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(75)
        }
        
        morningView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(30)
            $0.height.equalTo(54)
        }
        
        morningImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        morningRain.snp.makeConstraints {
            $0.top.equalTo(morningImage.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
        
        afternoonView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(30)
            $0.height.equalTo(54)
        }
        
        afternoonImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        afternoonRain.snp.makeConstraints {
            $0.top.equalTo(morningImage.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
        
        maxTempLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17)
            $0.trailing.equalToSuperview()
        }
        
        minTempLabel.snp.makeConstraints {
            $0.top.equalTo(maxTempLabel)
            $0.trailing.equalTo(maxTempLabel.snp.leading).inset(-12)
        }
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
