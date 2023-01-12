//
//  TimezoneWeatherData.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/10.
//

import UIKit

enum WeatherType: String {
    case clearDay = "맑음"
    case clearNight = "맑음밤"
    case cloudy = "흐림"
    case lotCloudDay = "구름많음"
    case lotCloudNight = "구름많음밤"
    case shower = "소나기"
    case lightRain = "이슬비"
    case rain = "비"
    case rainSnow = "비또는눈"
    case lightSnow = "진눈깨비"
    case snowDrifting = "눈날림"
    case snow = "눈"
    
    func setWeatherIcon() -> String {
        switch self {
        case .clearDay: return "icn_clear_day"
        case .clearNight: return "icn_clear_night"
        case .cloudy: return "icn_cloudy"
        case .lotCloudDay: return "icn_lotcloud_day"
        case .lotCloudNight: return "icn_lotcloud_night"
        case .shower: return "icn_shower"
        case .lightRain: return "icn_lightrain"
        case .rain: return "icn_rain"
        case .rainSnow: return "icn_rainsnow"
        case .lightSnow: return "icn_lightsnow"
        case .snowDrifting: return "icn_snowdrifting"
        case .snow: return "icn_heavysnow"
        }
    }
    
    func setWeatherImage() -> String {
        switch self {
        case .clearDay: return "img_clear_day"
        case .clearNight: return "img_clear_night"
        case .cloudy: return "img_cloudy"
        case .lotCloudDay: return "img_lotcloud_day"
        case .lotCloudNight: return "img_lotcloud_night"
        case .shower: return "img_shower"
        case .lightRain: return "img_lightrain"
        case .rain: return "img_rain"
        case .rainSnow: return "img_rainsnow"
        case .lightSnow: return "img_lightsnow"
        case .snowDrifting: return "img_snowdrifting"
        case .snow: return "img_heavysnow"
        }
    }
    
    func setTodayWeatherImage() -> UIImage {
        switch self {
        case .clearDay: return Image.imgClearDay
        case .clearNight: return Image.imgClearNight
        case .cloudy: return Image.imgCloudy
        case .lotCloudDay: return Image.imgLotcloudDay
        case .lotCloudNight: return Image.imgLotcloudNight
        case .shower: return Image.imgShower
        case .lightRain: return Image.imgLightrain
        case .rain: return Image.imgRain
        case .rainSnow: return Image.imgRainsnow
        case .lightSnow: return Image.imgLightsnow
        case .snowDrifting: return Image.imgSnowdrifting
        case .snow: return Image.imgSnow
        }
    }
    
    func setBackgroundImage() -> UIImage {
        switch self {
        case .clearDay: return Image.backViewDay
        case .clearNight: return Image.backViewNight
        case .cloudy: return Image.backViewCloud
        case .lotCloudDay: return Image.backViewDay
        case .lotCloudNight: return Image.backViewNight
        case .shower: return Image.backViewCloud
        case .lightRain: return Image.backViewRain
        case .rain: return Image.backViewRain
        case .rainSnow: return Image.backViewSnow
        case .lightSnow: return Image.backViewSnow
        case .snowDrifting: return Image.backViewSnow
        case .snow: return Image.backViewSnow
        }
    }
}

struct TimezoneWeatherData {
    let date: String
    let time: String
    let temperature: Int
    let day: Bool
    let image: String
    
    public static func dummyData() -> [TimezoneWeatherData] {
        return [
            TimezoneWeatherData(date: "20230110",
                                time: "2200",
                                temperature: 1,
                                day: false,
                                image: "흐림"),
            TimezoneWeatherData(date: "20230111",
                                time: "0000",
                                temperature: 0,
                                day: false,
                                image: "맑음"),
            TimezoneWeatherData(date: "20230111",
                                time: "0100",
                                temperature: 0,
                                day: false,
                                image: "구름많음"),
            TimezoneWeatherData(date: "20230111",
                                time: "0200",
                                temperature: 0,
                                day: true,
                                image: "맑음")
        ]
    }
}

