//
//  TodayWeatherDetailDto.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/11.
//

import Foundation

// MARK: - TodayWeatherDetailResponseDto

struct DetailTempDto: Codable {
    let date: String
    let time: String
    let temperature: Int
    let day: Bool
    let image: String
    
    func convertToDetaiTemp() -> TimezoneWeatherData {
        return TimezoneWeatherData(date: self.date, time: self.time, temperature: self.temperature, day: self.day, image: self.image)
    }
}
