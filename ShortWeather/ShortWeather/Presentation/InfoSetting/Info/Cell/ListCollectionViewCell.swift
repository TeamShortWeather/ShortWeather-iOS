//
//  ListCollectionViewCell.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/04.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ListCollectionViewCell"
    
    // MARK: - UI Components
    
    private let listLabel: UILabel = UILabel()
    
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

extension ListCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [listLabel].forEach {
            contentView.addSubview($0)
        }
        
        listLabel.do {
            $0.font = UIFont.fontGuide(.subhead2)
            $0.textColor = Color.gray7
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        listLabel.snp.makeConstraints {
            $0.width.equalTo(319)
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: List) {
        listLabel.text = model.listName
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = Color.gray1            }
        }
    }
}

