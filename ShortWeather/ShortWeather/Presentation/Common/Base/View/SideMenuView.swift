//
//  SideMenuView.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/01.
//

import UIKit

class SideMenuView: UIView {
    
    // MARK: - UI Components
    
    private let LogoIconImageView: UIImageView = UIImageView()
    private let LogoImageView: UIImageView = UIImageView()
    private let menuLabel: UILabel = UILabel()
    private let menuTableView: UITableView = UITableView()
    
    // MARK: - Initializer
    
    init() {
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout( ){
        
    }
}
