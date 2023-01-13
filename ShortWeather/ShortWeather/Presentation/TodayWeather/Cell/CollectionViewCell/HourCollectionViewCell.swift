//
//  HourCollectionViewCell.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/03.
//

import UIKit

import SnapKit
import Then

final class HourCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let timeLabel: UILabel =  UILabel()
    private let iconImageView: UIImageView = UIImageView()
    private let stateLabel: UILabel = UILabel()
    
    // MARK: - Properties
    
    var timezonePrecipitationState: DetailRainType?

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
    
    func setWeatherDataBind(_ model: DetailTemp) {
        timeLabel.text = model.time.changeToMeridiem()
        stateLabel.text = model.temperature.temperature
        iconImageView.image = WeatherType(rawValue: getIcon(model.day, model.image))?.setWeatherIcon()
    }
    
    func setPrecipitationDataBind(_ model: DetailRain) {
        timeLabel.text = model.time.changeToMeridiem()
        stateLabel.text = "\(model.rain)%"
        setPrecipitationPercentage(model.rain)  
        iconImageView.image = DetailRainType(rawValue: model.rain)?.setRainImage()
    }
    
    func setCurrent() {
        timeLabel.text = "지금"
    } 
    
    private func getIcon(_ day: Bool, _ image: String) -> String {
        var result = ""
        if !day {
            if image == WeatherType.clearDay.rawValue {
                result = WeatherType.clearNight.rawValue
            } else if image == WeatherType.lotCloudDay.rawValue {
                result = WeatherType.lotCloudNight.rawValue
            } else {
                result = WeatherType(rawValue: image)?.rawValue ?? ""
            }
        } else {
            result = WeatherType(rawValue: image)?.rawValue ?? ""
        }
        return result
    }
    
    private func setPrecipitationPercentage(_ precipitation: Int) {
        if precipitation >= 0 && precipitation < 10 {
            timezonePrecipitationState = .zero
        } else if precipitation >= 10 && precipitation < 20 {
            timezonePrecipitationState = .ten
        } else if precipitation >= 20 && precipitation < 30 {
            timezonePrecipitationState = .twenty
        } else if precipitation >= 30 && precipitation < 40 {
            timezonePrecipitationState = .thirty
        } else if precipitation >= 40 && precipitation < 50 {
            timezonePrecipitationState = .fourty
        } else if precipitation >= 50 && precipitation < 60 {
            timezonePrecipitationState = .fifty
        } else if precipitation >= 60 && precipitation < 70 {
            timezonePrecipitationState  = .sixty
        } else if precipitation >= 70 && precipitation < 80 {
            timezonePrecipitationState = .seventy
        } else if precipitation >= 80 && precipitation < 90 {
            timezonePrecipitationState = .eighty
        } else {
            timezonePrecipitationState = .ninety
        }
    }
}
