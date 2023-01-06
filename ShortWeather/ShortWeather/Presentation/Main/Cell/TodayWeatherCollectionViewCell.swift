//
//  TodayWeatherCollectionViewCell.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/04.
//

import UIKit

final class TodayWeatherCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let scrollView: UIScrollView = UIScrollView()
    private let firstTodayWeatherView: FirstTodayWeatherView = FirstTodayWeatherView(frame: .zero)
    private let secondTodayWeatherView: SecondTodayWeatherView = SecondTodayWeatherView(frame: .zero)
    
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

extension TodayWeatherCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        scrollView.do {
            $0.isPagingEnabled = true
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubview(scrollView)
        
        scrollView.addSubviews(firstTodayWeatherView, secondTodayWeatherView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        firstTodayWeatherView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.height.equalTo(contentView)
        }
        
        secondTodayWeatherView.snp.makeConstraints {
            $0.top.equalTo(firstTodayWeatherView.snp.bottom)
            $0.leading.trailing.height.equalTo(firstTodayWeatherView)
            $0.bottom.equalToSuperview()
        }
    }
}
