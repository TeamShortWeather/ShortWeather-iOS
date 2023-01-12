//
//  TodayWeatherQuestionResponse.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/12.
//

import Foundation

// MARK: - TodayWeatherQuestionResponse

struct TodayWeatherQuestionResponse: Codable {
    let temp: Int
    let weatherMessage: String
    
    func convertToWeatherQuestion() -> WeatherQuestionModel {
        return WeatherQuestionModel(temp: self.temp, weatherMessage: self.weatherMessage)
    }
}


