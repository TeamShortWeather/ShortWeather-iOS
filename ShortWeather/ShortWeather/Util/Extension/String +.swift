//
//  String +.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/11.
//

import Foundation

extension String {
    
    func changeToHour() -> String {
        let endIndex: String.Index = self.index(self.startIndex, offsetBy: 1)
        let result: Int = Int(String(self[...endIndex]))!
        
        if result > 12 {
            return "오후 \(result-12)시"
        } else if result == 0 {
            return "오전 12시"
        } else if result == 12 {
            return "오후 12시"
        } else {
            return "오전 \(result)시"
        }
    }
    
    static func createDeviceToken() -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String(
            (0..<50)
                .map { _ in letters.randomElement()! }
        )
    }
}
