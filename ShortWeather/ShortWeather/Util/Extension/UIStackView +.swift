//
//  File.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/02.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
