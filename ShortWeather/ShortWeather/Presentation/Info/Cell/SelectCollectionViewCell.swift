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
    
    // MARK: - UI Components
    
    private let explainLabel: UILabel = UILabel()
    private let bottomArrowImageView: UIImageView = UIImageView()
    private let selectDataLabel: UILabel = UILabel()
    public let lineView: UIView = UIView()
    
    // MARK: - Properties
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                print("cell Selected!")
                lineView.backgroundColor = Color.weatherBlue
            }
            else {
//                lineView.backgroundColor = Color.dustBad2
            }
        }
    }
    
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
            $0.textColor = .black
        }
        
        lineView.do {
            $0.backgroundColor = Color.gray1
        }
    }

    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(explainLabel, bottomArrowImageView, selectDataLabel, lineView)
        
        explainLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        bottomArrowImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        selectDataLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(lineView.snp.top)
        }
        
        lineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalTo(320)
            $0.height.equalTo(2)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Methods

    public func setDataBind(info: String, pickData: String) {
        explainLabel.text = info
        selectDataLabel.text = pickData
    }
    
    public func selectCell() {
        lineView.backgroundColor = Color.pointColor
    }
    
    public func unselectCell() {
        lineView.backgroundColor = Color.dustBad2
        explainLabel.textColor = Color.dustBad2
        bottomArrowImageView.tintColor = Color.dustBad2
    }
}

