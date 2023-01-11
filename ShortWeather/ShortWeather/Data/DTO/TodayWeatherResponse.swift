//
//  TodayWeatherResponse.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/12.
//

import Foundation

// MARK: - TodayWeatherResponse

struct TodayWeatherResponse: Codable {
    let location: String
    let compareTemp: Int
    let compareMessage: String
    let breakingNews: String
    let fineDust: [Int]
    let ultrafineDust: [Int]
    let day: Bool
    let image: String
    let currentTemp: Int
    let minTemp: Int
    let maxTemp: Int
    let weatherMessage: String
}
