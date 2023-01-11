//
//  TodayWeatherDetailDto.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/11.
//

import Foundation

// MARK: - TodayWeatherDetailResponse

//struct DetailGoOut: Codable {
//    let time: String
//    let temp: Int
//    let day: Bool
//    let image: String
//}
//
//struct DetailGoHome: Codable {
//    let time: String
//    let temp: Int
//    let day: Bool
//    let image: String
//}
//
//struct DetailTodayWeather: Codable {
//    let humidity: Int
//    let sunrise: String
//    let sunset: String
//    let fineDust: Int
//    let ultraFineDust: Int
//}

struct DetailWeatherResponse: Codable {
    let location: String
    let goOut: DetailGoOut
    let goHome: DetailGoHome
    let todayWeather: DetailTodayWeather
    
    struct DetailGoOut: Codable {
        let time: String
        let temp: Int
        let day: Bool
        let image: String
    }

    struct DetailGoHome: Codable {
        let time: String
        let temp: Int
        let day: Bool
        let image: String
    }

    struct DetailTodayWeather: Codable {
        let humidity: Int
        let sunrise: String
        let sunset: String
        let fineDust: Int
        let ultraFineDust: Int
    }

    func convertToDetailWeather() -> SecondTodayWeather {
        let goOut = GoOut(time: self.goOut.time, temp: self.goOut.temp, day: self.goOut.day, image: self.goOut.image)
        let goHome = GoHome(time: self.goHome.time, temp: self.goHome.temp, day: self.goHome.day, image: self.goHome.image)
        let todayWeather = TodayWeather(humidity: self.todayWeather.humidity, sunrise: self.todayWeather.sunrise, sunset: self.todayWeather.sunset, fineDust: self.todayWeather.fineDust, ultraFineDust: self.todayWeather.ultraFineDust)
        return SecondTodayWeather(location: self.location, goOut: goOut, goHome: goHome, todayWeather: todayWeather)
    }
}

struct DetailTempResponse: Codable {
    let date: String
    let time: String
    let temperature: Int
    let day: Bool
    let image: String
    
    func convertToDetailTemp() -> TimezoneWeatherData {
        return TimezoneWeatherData(date: self.date, time: self.time, temperature: self.temperature, day: self.day, image: self.image)
    }
}

struct DetailRainResponse: Codable {
    let date: String
    let time: String
    let rain: Int
    
    func convertToDetailRain() -> TimezonePrecipitationData {
        return TimezonePrecipitationData(date: self.date, time: self.time, rain: self.rain)
    }
}
