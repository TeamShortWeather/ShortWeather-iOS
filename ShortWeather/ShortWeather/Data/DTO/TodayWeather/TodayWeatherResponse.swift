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
    let breakingNews: String?
    let fineDust, ultrafineDust: Int
    let day: Bool
    let image: String
    let currentTemp, minTemp, maxTemp: Int
    let weatherMessage: String
}
