//
//  TodayWeatherViewController.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/04.
//

import UIKit

import Moya
import SnapKit
import Then

final class TodayWeatherViewController: BaseLocationViewController {
    
    // MARK: - UI Components
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
    }
}

extension TodayWeatherViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        locationCollectionView.registerCell(TodayWeatherCollectionViewCell.self)
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        locationCollectionView.dataSource = self
    }
    
    // MARK: - @objc Methods
}

extension TodayWeatherViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = locationCollectionView.dequeueCell(type: TodayWeatherCollectionViewCell.self, indexPath: indexPath)
        return cell
    }
}
