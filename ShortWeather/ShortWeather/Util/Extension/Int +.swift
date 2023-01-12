//
//  Int +.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/11.
//

import Foundation

extension Int {
    
    var temperature: String {
        return "\(self)˚"
    }
    
    func makeToCompareTemp() -> String {
        if self <= 0 {
            return "어제보다 \(self)˚"
        } else {
            return "어제보다 +\(self)˚"
        }
    }
}
