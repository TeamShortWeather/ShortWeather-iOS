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
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRegister()
        setDelegate()
    }
}

extension TodayWeatherViewController {
    
    // MARK: - Methods
    
    private func setRegister() {
        locationCollectionView.registerCell(TodayWeatherCollectionViewCell.self)
    }
    private func setDelegate() {
        locationCollectionView.dataSource = self
    }
}

extension TodayWeatherViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = locationCollectionView.dequeueCell(type: TodayWeatherCollectionViewCell.self, indexPath: indexPath)
        return cell
    }
}
