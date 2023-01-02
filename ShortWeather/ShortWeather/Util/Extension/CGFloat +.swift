//
//  CGFloat +.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/01.
//

import UIKit

extension CGFloat {
    
    var adjusted: CGFloat {
        let ratio: CGFloat = UIScreen.main.bounds.width / 375
        let ratioH: CGFloat = UIScreen.main.bounds.height / 821
        return ratio <= ratioH ? self * ratio : self * ratioH
    }
}
