//
//  HourCollectionViewCell.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/03.
//

import UIKit

final class HourCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let timeLabel: UILabel =  UILabel()
    private let iconImageView: UIImageView = UIImageView()
    private let stateLabel: UILabel = UILabel()

    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HourCollectionViewCell {
    
    // MARK: - UI Components property
    
    private func setUI() {
        contentView.backgroundColor = .clear
        
        timeLabel.do {
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray7
        }

        stateLabel.do {
            $0.font = .fontGuide(.caption1)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(timeLabel, iconImageView, stateLabel)
        
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.centerX.centerY.equalToSuperview()
        }

        stateLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func setWeatherDataBind(_ model: TimezoneWeatherData) {
        timeLabel.text = model.time.changeToMeridiem()
        stateLabel.text = model.temperature.temperature
        iconImageView.image = UIImage(named: getIcon(model.day, model.image))
    }
    
    func setPrecipitationDataBind(_ model: TimezonePrecipitationData) {
        timeLabel.text = model.time.changeToMeridiem()
        stateLabel.text = "\(model.rain)%"
        iconImageView.image = UIImage(named: TimezonePrecipitationType(rawValue: model.rain)?.setPrecipitationImage() ?? "")
    }
    
    func setCurrent() {
        timeLabel.text = "지금"
    } 
    
    private func getIcon(_ day: Bool, _ image: String) -> String {
        var result = ""
        
        result = WeatherType(rawValue: image)?.setWeatherIcon() ?? ""
        
        if !day {
            if image == WeatherType.clearDay.rawValue {
                result = WeatherType.clearNight.setWeatherIcon()
            } else if image == WeatherType.lotCloudDay.rawValue {
                result = WeatherType.lotCloudNight.setWeatherIcon()
            } else {
                result = WeatherType(rawValue: image)?.setWeatherIcon() ?? ""
            }
        }

        return result
    }
}
