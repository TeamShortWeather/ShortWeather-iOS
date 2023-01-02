//
//  UIView +.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/02.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
