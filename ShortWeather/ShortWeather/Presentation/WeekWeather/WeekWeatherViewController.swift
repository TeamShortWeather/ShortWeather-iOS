//
//  WeekWeatherViewController.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/09.
//

import UIKit

import Moya
import SnapKit
import Then

class WeekWeatherViewController: BaseLocationViewController {
    
    private let weekWeatherUIView: UIView = WeekWeatherUIView()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setting() // 임시 방편 ...
    }
}

extension WeekWeatherViewController {
    
    // MARK: - Methods

    private func setting() {
        view.backgroundColor = .white
        view.addSubview(weekWeatherUIView)
        weekWeatherUIView.snp.makeConstraints {
            $0.top.equalTo(locationView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
