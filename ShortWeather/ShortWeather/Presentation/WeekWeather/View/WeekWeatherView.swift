//
//  WeekWeatherView.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/09.
//

import UIKit

import SnapKit
import Then

final class WeekWeatherView: UIView {
    
    // MARK: - UI Components
    
    private let weekWeatherCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    private var weatherWeekModel: [WeatherWeekModel] = WeatherWeekModel.weatherWeekdummyData()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeekWeatherView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        weekWeatherCollectionView.do {
            $0.registerCell(WeekWeatherCollectionViewCell.self)
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = .clear
            $0.register(WeekWeatherHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: WeekWeatherHeaderView.identifier)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(weekWeatherCollectionView)
        
        weekWeatherCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(28)
            $0.trailing.equalToSuperview().inset(28)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        weekWeatherCollectionView.delegate = self
        weekWeatherCollectionView.dataSource = self
    }
}

//MARK: - UICollectionViewDataSource

extension WeekWeatherView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherWeekModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: WeekWeatherCollectionViewCell.self, indexPath: indexPath)
        cell.setDataBind(model: weatherWeekModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: WeekWeatherHeaderView.identifier,
                                                                           for: indexPath) as? WeekWeatherHeaderView else {
            return UICollectionReusableView()
        }
        return header
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension WeekWeatherView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = bounds.size.width - 56
        return CGSize(width: width, height: 72)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: 18)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
    }
}
