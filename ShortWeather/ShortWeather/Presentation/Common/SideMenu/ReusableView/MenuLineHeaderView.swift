//
//  MenuLineHeaderView.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/03.
//

import UIKit

final class MenuLineHeaderView: UITableViewHeaderFooterView {

    // MARK: - UI Components
    
    private let lineView: UIView = UIView()

    // MARK: - Initializer
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setLineView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setLineView() {
        lineView.backgroundColor = Color.gray2
        
        addSubview(lineView)
        
        lineView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(28)
        }
    }
    
}
