//
//  AlarmTableViewCell.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/06.
//

import UIKit

import SnapKit
import Then

final class AlarmTableViewCell: UITableViewCell {

    // MARK: - UI Components
    
    private let alarmLabel: UILabel = UILabel()
    private let alarmDescriptionLabel: UILabel = UILabel()
    private lazy var alarmLabelStackView: UIStackView = UIStackView()
    private let alarmSwitchButton: UISwitch = UISwitch()
    
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

extension AlarmTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        alarmLabel.do {
            $0.text = "테스트"
            $0.font = .fontGuide(.subhead2)
        }
        
        alarmDescriptionLabel.do {
            $0.text = "테스트"
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray7
        }
        
        alarmLabelStackView.do { 
            $0.axis = .vertical
            $0.spacing = 6
        }
        
        alarmSwitchButton.do { 
            $0.tintColor = Color.pointColor
            $0.onTintColor = Color.pointColor
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        alarmLabelStackView.addArrangedSubviews(alarmLabel, alarmDescriptionLabel)
        contentView.addSubviews(alarmLabelStackView, alarmSwitchButton)
        
        alarmLabelStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(28)
            $0.centerY.equalToSuperview()
        }
        
        alarmSwitchButton.snp.makeConstraints { 
            $0.trailing.equalToSuperview().offset(-28)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(63)
            $0.height.equalTo(33)
        }
    }
    
    // MARK: - Methods
    
    func dataBind(_ model: AlarmSetting) {
        alarmLabel.text = model.title
        alarmDescriptionLabel.text = model.description
        alarmSwitchButton.isOn = model.isOn
    }
}
