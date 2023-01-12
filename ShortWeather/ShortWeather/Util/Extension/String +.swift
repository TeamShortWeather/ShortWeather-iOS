//
//  String +.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/11.
//

import Foundation

extension String {
    
    func changeToMeridiem() -> String {
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
    
    private func stringToTime(dayTime: String, hourTime: Int, minuteTime: String) -> String {
        var stringTime: String = ""
        if dayTime == "오전" {
            stringTime = "0" + String(hourTime) + minuteTime
        }
        else if dayTime == "오후" {
            stringTime = String(hourTime + 12) + minuteTime
        }
        return stringTime
    }
    
    func changeToTwelveHour() -> String {
        let hourEndIndex: String.Index = self.index(self.startIndex, offsetBy: 1)
        let hour = Int(String(self[...hourEndIndex]))!
        let minStartIndex: String.Index = self.index(self.startIndex, offsetBy: 2)
        let minEndIndex: String.Index = self.index(self.startIndex, offsetBy: 3)
        let min = String(self[minStartIndex...minEndIndex])
        
        if hour > 12 {
            return "\(hour-12):"+min
        } else if hour == 0 {
            return "12:"+min
        } else if hour == 12 {
            return "12:"+min
        } else {
            return "\(hour):"+min
        }
    }
}
