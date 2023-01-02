//
//  UIFont +.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2022/12/28.
//

import UIKit

extension UIFont {
        
    public static func fontGuide(_ fontLevel: FontLevel) -> UIFont {
        return UIFont(name: fontLevel.fontWeight, size: fontLevel.fontSize)!
    }
}
