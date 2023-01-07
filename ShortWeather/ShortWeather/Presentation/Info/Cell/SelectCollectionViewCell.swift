//
//  SelectCollectionViewCell.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/03.
//

import UIKit

import Moya
import SnapKit
import Then


class SelectCollectionViewCell: UICollectionViewCell {
    
    let identifier = "SelectCollectionViewCell"
        
    // MARK: - UI Components
    
    private let explainLabel: UILabel = UILabel()
    private let bottomArrowImageView: UIImageView = UIImageView()
    private let selectDataLabel: UILabel = UILabel()
    public let lineView: UIView = UIView()
    private let selectView: UIView = UIView()
    
    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
//        selectCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectCollectionViewCell {

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
        }
        
        selectDataLabel.do {
            $0.font = .fontGuide(.subhead1)
            $0.textColor = Color.black
        }
        
        lineView.do {
            $0.backgroundColor = Color.gray1
        }
        
        selectView.do {
            $0.backgroundColor = Color.white
        }
    }

    // MARK: - Layout Helper
    
    private func setLayout() {
        selectView.addSubviews(bottomArrowImageView, selectDataLabel)
        addSubviews(explainLabel, lineView, selectView)
        
        explainLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        selectView.snp.makeConstraints {
            $0.top.equalTo(explainLabel.snp.bottom).offset(2)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        bottomArrowImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-10)
            $0.centerY.equalToSuperview()
        }
        
        selectDataLabel.snp.makeConstraints {
            $0.leading.equalTo(explainLabel)
            $0.centerY.equalToSuperview()
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(selectView.snp.bottom)
            $0.leading.trailing.equalTo(selectView)
            $0.height.equalTo(2)
        }
    }
    
    // MARK: - Methods

    public func setDataBind(info: String, pickData: String) {
        explainLabel.text = info
        selectDataLabel.text = pickData
    }
    
    public func selectCell() {
        lineView.backgroundColor = Color.pointColor
        print("Tapp!!!!")
    }
    
    public func unselectCell() {
        lineView.backgroundColor = Color.dustBad2
        explainLabel.textColor = Color.dustBad2
        bottomArrowImageView.tintColor = Color.dustBad2
    }
}

