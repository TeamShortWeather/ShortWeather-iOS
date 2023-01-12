//
//  TodayWeatherQuestionResponse.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/13.
//

import Foundation

struct TodayWeatherQuestionResponse: Codable {
    let temp: Int
    let weatherMessage: String
    
    func convertToWeatherQuestion() -> WeatherQuestionModel {
        return WeatherQuestionModel(temp: self.temp, weatherMessage: self.weatherMessage)
    }
}
