//
//  CommuteTableViewCell.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/03.
//

import UIKit

import SnapKit
import Then

final class CommuteTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let outLabel: UILabel = UILabel()
    private let outTimeLabel: UILabel = UILabel()
    private lazy var outTimeStackView: UIStackView = UIStackView()
    private let outWeatherImageView: UIImageView = UIImageView()
    private let outTemperatureLabel: UILabel = UILabel()
    private lazy var outStackView: UIStackView = UIStackView()
    
    private let comeLabel: UILabel = UILabel()
    private let comeTimeLabel: UILabel = UILabel()
    private lazy var comeTimeStackView: UIStackView = UIStackView()
    private let comeWeatherImageView: UIImageView = UIImageView()
    private let comeTemperatureLabel: UILabel = UILabel()
    private lazy var comeStackView: UIStackView = UIStackView()
    
    private lazy var baseStackView: UIStackView = UIStackView()
    
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CommuteTableViewCell {
    
    // MARK: - UI Components property
    
    private func setUI() {
        contentView.backgroundColor = .white
        self.selectionStyle = .none
        
        outLabel.do {
            $0.text = "외출 시간"
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray7
        }
        
        outTimeLabel.do {
            $0.text = "오전 8시"
            $0.font = .fontGuide(.subhead2)
        }
        
        outTimeStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 2
        }
        
        outWeatherImageView.do {
            $0.backgroundColor = Color.gray3
        }
        
        outTemperatureLabel.do {
            $0.text = "-12°"
            $0.font = .fontGuide(.subhead1)
        }
        
        outStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.distribution = .equalSpacing
        }
        
        comeLabel.do {
            $0.text = "귀가 시간"
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray7
        }
        
        comeTimeLabel.do {
            $0.text = "오후 8시"
            $0.font = .fontGuide(.subhead2)
        }
        
        comeTimeStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 2
        }
        
        comeWeatherImageView.do {
            $0.backgroundColor = Color.gray3
        }
        
        comeTemperatureLabel.do {
            $0.text = "-17°"
            $0.font = .fontGuide(.subhead1)
        }
        
        comeStackView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.distribution = .equalSpacing
        }
        
        baseStackView.do {
            $0.spacing = 55
        }
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(baseStackView)
        baseStackView.addArrangedSubviews(outStackView, comeStackView)
        outTimeStackView.addArrangedSubviews(outLabel, outTimeLabel)
        outStackView.addArrangedSubviews(outTimeStackView, outWeatherImageView, outTemperatureLabel)
        comeTimeStackView.addArrangedSubviews(comeLabel, comeTimeLabel)
        comeStackView.addArrangedSubviews(comeTimeStackView, comeWeatherImageView, comeTemperatureLabel)
        
        outWeatherImageView.snp.makeConstraints {
            $0.height.width.equalTo(100)
        }

        outStackView.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalToSuperview()
        }

        comeWeatherImageView.snp.makeConstraints {
            $0.height.width.equalTo(100) 
        }

        comeStackView.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalToSuperview()
        }
        
        baseStackView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(255)
            $0.height.equalTo(181)
        }
    }
}
