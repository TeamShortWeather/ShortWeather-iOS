//
//  InfoEnterCollectionViewCell.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/03.
//

import UIKit

import Moya
import SnapKit
import Then


final class EnterInfoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let explainLabel: UILabel = UILabel()
    private let bottomArrowImageView: UIImageView = UIImageView()
    private let dataLabel: UILabel = UILabel()
    public let lineView: UIView = UIView()
    
    // MARK: - Properties
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                selectCell()
            }
        }
    }
    public var isTouched: Bool = false
    
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

extension EnterInfoCollectionViewCell {

    // MARK: - UI Components Property
    
    private func setUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        explainLabel.do {
            $0.font = .fontGuide(.caption1)
            $0.textColor = Color.gray7
        }
        
        bottomArrowImageView.do {
            $0.image = UIImage(systemName: "chevron.down")
            $0.tintColor = Color.gray4
            $0.contentMode = .scaleAspectFit
        }
        
        dataLabel.do {
            $0.font = .fontGuide(.subhead1)
            $0.textColor = Color.black
        }
        
        lineView.do {
            $0.backgroundColor = Color.gray1
        }
    }

    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(explainLabel, lineView, bottomArrowImageView, dataLabel)
        
        explainLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        dataLabel.snp.makeConstraints {
            $0.top.equalTo(explainLabel.snp.bottom).offset(2)
            $0.leading.equalTo(explainLabel)
            $0.height.equalTo(44)
        }
        
        bottomArrowImageView.snp.makeConstraints {
            $0.centerY.equalTo(dataLabel)
            $0.height.width.equalTo(18)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        lineView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
    }
    
    // MARK: - Methods

    public func setDataBind(infoText: String, data: String) {
        explainLabel.text = infoText
        dataLabel.text = data
    }
    
    public func selectCell() {
        explainLabel.textColor = Color.gray7
        bottomArrowImageView.tintColor = Color.gray4
        lineView.backgroundColor = Color.pointColor
    }
    
    public func untouched() {
        explainLabel.textColor = Color.gray7
        bottomArrowImageView.tintColor = Color.gray4
        lineView.backgroundColor = Color.gray1
    }
    
    public func unselectCell() {
        lineView.backgroundColor = Color.dustBad2
        explainLabel.textColor = Color.dustBad2
        bottomArrowImageView.tintColor = Color.dustBad2
    }
}

