//
//  TimezoneWeatherData.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/10.
//

import UIKit

enum TimezoneWeatherImageType: String {
    case clearDay = "맑음"
//    case clearNight = "맑음"
    case cloudy = "흐림"
    case lotCloudDay = "구름 많음"
//    case lotCloudNight = "구름 많음"
    case shower = "소나기"
    case lightRain = "이슬비"
    case rain = "비"
    case rainSnow = "비 또는 눈"
    case lightSnow = "진눈깨비"
    case snowDrifting = "눈날림"
    case snow = "눈"
    
    func setWeatherImage() -> String {
        switch self {
        case .clearDay: return "icn_clear_day"
//        case .clearNight: return "icn_clear_night"
        case .cloudy: return "icn_cloudy"
        case .lotCloudDay: return "icn_lotcloud_day"
//        case .lotCloudNight: return "icn_lotcloud_night"
        case .shower: return "icn_shower"
        case .lightRain: return "icn_lightrain"
        case .rain: return "icn_rain"
        case .rainSnow: return "icn_rainsnow"
        case .lightSnow: return "icn_lightsnow"
        case .snowDrifting: return "icn_snowdrifting"
        case .snow: return "icn_heavysnow"
        }
    }
}

struct TimezoneWeatherData {
    let date: String
    let time: String
    let temperature: Int
    let image: String
    
    public static func dummyData() -> [TimezoneWeatherData] {
        return [TimezoneWeatherData(date: "20230110",
                                   time: "0200",
                                   temperature: -2,
                                   image: "맑음"),
                TimezoneWeatherData(date: "20230110",
                                    time: "0300",
                                    temperature: -2,
                                    image: "흐림"),
                TimezoneWeatherData(date: "20230110",
                                    time: "0400",
                                    temperature: -3,
                                    image: "구름 많음"),
                TimezoneWeatherData(date: "20230110",
                                    time: "0500",
                                    temperature: -2,
                                    image: "소나기"),
                TimezoneWeatherData(date: "20230110",
                                    time: "0600",
                                    temperature: -3,
                                    image: "이슬비"),
                TimezoneWeatherData(date: "20230110",
                                    time: "0700",
                                    temperature: -3,
                                    image: "비"),
                TimezoneWeatherData(date: "20230110",
                                    time: "01500",
                                    temperature: -3,
                                    image: "눈")
                ]
    }
}

