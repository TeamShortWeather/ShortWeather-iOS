//
//  DetailTempRespone.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/13.
//

import Foundation

struct DetailTempResponse: Codable {
    let date: String
    let time: String
    let temperature: Int
    let day: Bool
    let image: String
    
    func convertToDetailTemp() -> DetailTemp {
        return DetailTemp(date: self.date, time: self.time, temperature: self.temperature, day: self.day, image: self.image)
    }
}
