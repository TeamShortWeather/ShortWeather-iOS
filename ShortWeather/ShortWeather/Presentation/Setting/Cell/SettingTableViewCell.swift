//
//  SettingTableViewCell.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/06.
//

import UIKit

import SnapKit
import Then

final class SettingTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = UILabel()
    private let expandButton: UIButton = UIButton()
    
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

extension SettingTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        selectionStyle = .none
        
        titleLabel.do {
            $0.font = .fontGuide(.subhead2)
        }
        
        expandButton.do {
            $0.setImage(Image.icnExpandRight, for: .normal)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(titleLabel, expandButton)
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(28)
        }
        
        expandButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-18)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(44)
            $0.width.equalTo(expandButton.snp.height)
        }
    }
    
    // MARK: - Methods
    
    func dataBind(_ title: String) {
        titleLabel.text = title
    }
}
