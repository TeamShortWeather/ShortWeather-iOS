//
//  FirstTodayWeatherView.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/04.
//

import UIKit

final class FirstTodayWeatherView: UIView {

    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Color.mainColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
