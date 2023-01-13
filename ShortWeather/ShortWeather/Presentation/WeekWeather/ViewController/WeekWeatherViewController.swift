//
//  WeekWeatherViewController.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/09.
//

import UIKit

import SnapKit

final class WeekWeatherViewController: BaseLocationViewController {
    
    // MARK: - UI Components
    
    private let weekWeatherView: UIView = WeekWeatherView()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension WeekWeatherViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        viewTitleLabel.text = Letter.weekWeather
    }
    
    // MARK: - Layout Helper

    private func setLayout() {
        view.backgroundColor = .white
        view.addSubview(weekWeatherView)
        
        weekWeatherView.snp.makeConstraints {
            $0.top.equalTo(locationView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
