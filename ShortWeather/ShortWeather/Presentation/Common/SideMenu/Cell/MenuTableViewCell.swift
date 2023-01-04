//
//  MenuTableViewCell.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/03.
//

import UIKit

final class MenuTableViewCell: UITableViewCell {

    // MARK: - UI Components
    
    private let menuImageView: UIImageView = UIImageView()
    private let menuLabel: UILabel = UILabel()
    
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

extension MenuTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        menuLabel.do {
            $0.font = .fontGuide(.subhead2)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(menuImageView, menuLabel)
        menuImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(28)
            $0.width.height.equalTo(22)
        }
        menuLabel.snp.makeConstraints {
            $0.top.centerY.equalTo(menuImageView)
            $0.leading.equalTo(menuImageView.snp.trailing).offset(10)
        }
    }
    
    // MARK: - Methods
    
    public func setDataBind(menuImage: UIImage, menuText: String) {
        menuImageView.image = menuImage
        menuLabel.text = menuText
    }
}
