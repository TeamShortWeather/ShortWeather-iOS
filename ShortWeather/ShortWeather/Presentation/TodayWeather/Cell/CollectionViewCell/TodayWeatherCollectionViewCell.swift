//
//  TodayWeatherCollectionViewCell.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/04.
//

import UIKit

import Moya
import SnapKit
import Then

final class TodayWeatherCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let scrollView: UIScrollView = UIScrollView()
    private var firstTodayWeatherView: FirstTodayWeatherView = FirstTodayWeatherView()
    private var secondTodayWeatherView: SecondTodayWeatherView = SecondTodayWeatherView(frame: .zero)
    private var refreshControl = UIRefreshControl()
    
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
            $0.showsVerticalScrollIndicator = false
            $0.refreshControl = refreshControl
        }
        
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        scrollView.delegate = self
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
    
    // MARK: - Methods
    
    public func setDataBind(todayWeather: TodayWeatherResponse) {
        firstTodayWeatherView.setDataBind(todayWeather: todayWeather)
    }
    
    // MARK: - @objc Methods
    
    @objc private func refresh() {
        scrollView.reloadInputViews()
    }
}

//MARK: - UIScrollViewDelegate

extension TodayWeatherCollectionViewCell: UIScrollViewDelegate {

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }
}
