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
    
    static let identifier = "SelectCollectionViewCell"
    
    // MARK: - UI Components

    private let joinLabel: UILabel = UILabel()
    private let joinImage: UIImageView = UIImageView()
    private let joinTextField: UITextField = UITextField()
    private let lineView: UIView = UIView()
    

    // MARK: - View Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
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
        [joinLabel, joinImage, joinTextField, lineView].forEach {
            contentView.addSubviews($0)
        }
        
        joinLabel.do {
            $0.font = UIFont.fontGuide(.caption1)
            $0.textColor = Color.gray7
        }
        
        joinImage.do {
            $0.image = Image.iconExpandDown2
        }
        
        joinTextField.do {
            $0.isUserInteractionEnabled = false // 키보드 안나타나게
        }
        
        lineView.do {
            $0.backgroundColor = Color.gray1
        }
    }

    // MARK: - Layout Helper
    
    private func setLayout() {
        
        joinLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
        }
        
        joinImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        joinTextField.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(2)
            $0.width.equalTo(275)
            $0.height.equalTo(44)
        }
        
        lineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalTo(320)
            $0.height.equalTo(2)
            $0.centerX.equalToSuperview()
        }
    }
    

    // MARK: - Methods

    func setDataBind(model: Info) {
        joinLabel.text = model.labelName
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                lineView.backgroundColor = Color.weatherBlue
            }
            else {
                lineView.backgroundColor = Color.gray0
            }
        }
    }
}

