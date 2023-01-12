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
    private let dayImage: UIImageView = UIImageView()
    private let dayRainLabel: UILabel = UILabel()
    private let dayView: UIView = UIView()
    private let nightImage: UIImageView = UIImageView()
    private let nightRainLabel: UILabel = UILabel()
    private let nightView: UIView = UIView()
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
//            $0.text = "오늘"
            $0.font = .fontGuide(.subhead3)
        }
        
        dateWeekLabel.do {
//            $0.text = "12.20"
            $0.font = .fontGuide(.body2)
        }
        
        dayImage.do {
            $0.image = Image.icnLotcloudDay
        }
        
        dayRainLabel.do {
//            $0.text = "60%"
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray4
        }
        
        nightImage.do {
            $0.image = Image.icnRain
        }
        
        nightRainLabel.do {
//            $0.text = "100%"
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray4
        }
        
        minTempLabel.do {
//            $0.text = "-10°"
            $0.font = .fontGuide(.subhead2)
            $0.textColor = Color.gray4
        }
        
        maxTempLabel.do {
//            $0.text = "-11°"
            $0.font = .fontGuide(.subhead2)
            $0.textColor = Color.gray7
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(dayWeekLabel, dateWeekLabel, weekImageView, minTempLabel, maxTempLabel)
        weekImageView.addSubviews(dayView, nightView)
        dayView.addSubviews(dayImage, dayRainLabel)
        nightView.addSubviews(nightImage, nightRainLabel)
        
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
        
        dayView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(30)
            $0.height.equalTo(54)
        }
        
        dayImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(30)
        }
        
        dayRainLabel.snp.makeConstraints {
            $0.top.equalTo(dayImage.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
        
        nightView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(30)
            $0.height.equalTo(54)
        }
        
        nightImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.height.equalTo(30)
        }
        
        nightRainLabel.snp.makeConstraints {
            $0.top.equalTo(dayImage.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
        
        maxTempLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17)
            $0.trailing.equalToSuperview()
        }
        
        minTempLabel.snp.makeConstraints {
            $0.top.equalTo(maxTempLabel)
            $0.trailing.equalToSuperview().inset(30)
//            $0.trailing.equalTo(maxTempLabel.snp.leading).inset(-12)
            $0.width.equalTo(36)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: WeatherWeekModel) {
        let model = WeatherWeekModel.weatherWeekdummyData()
        
        dayWeekLabel.text = model.day
        if model.day == "일" {
            dayWeekLabel.textColor = .red
            dateWeekLabel.textColor = .red
        }
        
        let monthSplit: Int = Int(model.date.prefix(2)) ?? 0
        let dateSplit: String = String(monthSplit) + "." + model.date.suffix(2)
        dateWeekLabel.text = dateSplit
        
        dayImage.image = UIImage(named: WeatherType(rawValue: model.dayImage)?.setWeatherIcon() ?? "맑음")
        
        dayRainLabel.text = String(model.dayRain) + "%"
        
        nightImage.image = UIImage(named: WeatherType(rawValue: model.nightImage)?.setWeatherIcon() ?? "맑음")
        
        nightRainLabel.text = String(model.nightRain) + "%"
        
        minTempLabel.text = String(model.minTemp) + "°"
        
        maxTempLabel.text = String(model.maxTemp) + "°"
    }
    
    // MARK: - @objc Methods
}
