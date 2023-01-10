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
//            $0.text = "지금"
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray7
        }
        
//        iconImageView.do {
//            $0.backgroundColor = Color.gray2
//        }
        
        stateLabel.do {
//            $0.text = "22°"
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
    
    func setDataBind(_ model: TimezoneWeatherData) {
        timeLabel.text = changeToHour(model.time)
        stateLabel.text = "\(model.temperature)°"
        iconImageView.image = UIImage(named: TimezoneWeatherImageType(rawValue: model.image)?.setWeatherImage() ?? "")
    }
    
    func setCurrent() {
        timeLabel.text = "지금"
    }
    
    private func changeToHour(_ time: String) -> String {
        let endIndex: String.Index = time.index(time.startIndex, offsetBy: 1)
        let result = Int(String(time[...endIndex]))!
        
        if result > 12 {
            return "오후 \(result-12)시"
        } else {
            return "오전 \(result)시"
        }
    }
}
