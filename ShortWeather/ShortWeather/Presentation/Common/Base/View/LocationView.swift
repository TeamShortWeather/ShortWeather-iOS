//
//  LocationView.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/04.
//

import UIKit

final class LocationView: UIView {
    
    // MARK: - UI Components
    
    private let locationImageView: UIImageView = UIImageView()
    public let locationLabel: UILabel = UILabel()
    
    // MARK: - Initializer
    
    init() {
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LocationView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        locationImageView.do {
            $0.image = Image.icnLocation
        }
        
        locationLabel.do {
            $0.font = .fontGuide(.headline2)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(locationImageView, locationLabel)
        
        locationImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(28)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
        locationLabel.snp.makeConstraints {
            $0.leading.equalTo(locationImageView.snp.trailing).offset(4)
            $0.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    public func setDataBind(_ location: String) {
        locationLabel.text = location
    }
    
}
