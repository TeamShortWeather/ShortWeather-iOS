//
//  NSObject +.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/03.
//

import Foundation

extension NSObject {
    
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
     var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}

