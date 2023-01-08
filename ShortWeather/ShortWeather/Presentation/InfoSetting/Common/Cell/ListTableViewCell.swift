//
//  ListTableViewCell.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/04.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let listLabel: UILabel = UILabel()
    
    // MARK: - View Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        backgroundColor = .clear
        
        contentView.backgroundColor = .clear
        contentView.addSubview(listLabel)
        
        listLabel.do {
            $0.font = UIFont.fontGuide(.subhead2)
            $0.textColor = Color.gray7
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        listLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(28)
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: String) {
        listLabel.text = model
    }
}
