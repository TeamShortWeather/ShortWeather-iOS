//
//  TodayWeatherDetailDto.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/11.
//

import Foundation

struct DetailRainResponse: Codable {
    let date: String
    let time: String
    let rain: Int
    
    func convertToDetailRain() -> DetailRain {
        return DetailRain(date: self.date, time: self.time, rain: self.rain)
    }
}
