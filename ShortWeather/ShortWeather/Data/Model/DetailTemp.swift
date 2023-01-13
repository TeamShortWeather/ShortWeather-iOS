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
    case rainSnow = "비 또는 눈"
    case lightSnow = "진눈깨비"
    case snowDrifting = "눈날림"
    case snow = "눈"
    
    func setWeatherIcon() -> UIImage {
        switch self {
        case .clearDay: return UIImage(named: "icn_clear_day") ?? UIImage()
        case .clearNight: return UIImage(named: "icn_clear_night") ?? UIImage()
        case .cloudy: return UIImage(named: "icn_cloudy") ?? UIImage()
        case .lotCloudDay: return UIImage(named: "icn_lotcloud_day") ?? UIImage()
        case .lotCloudNight: return UIImage(named: "icn_lotcloud_night") ?? UIImage()
        case .shower: return UIImage(named: "icn_shower") ?? UIImage()
        case .lightRain: return UIImage(named: "icn_lightrain") ?? UIImage()
        case .rain: return UIImage(named: "icn_rain") ?? UIImage()
        case .rainSnow: return UIImage(named: "icn_rainsnow" ) ?? UIImage()
        case .lightSnow: return UIImage(named: "icn_lightsnow") ?? UIImage()
        case .snowDrifting: return UIImage(named: "icn_snowdrifting") ?? UIImage()
        case .snow: return UIImage(named: "icn_heavysnow") ?? UIImage()
        }
    }
    
    func setWeatherImage() -> UIImage {
        switch self {
        case .clearDay: return UIImage(named: "img_clear_day") ?? UIImage()
        case .clearNight: return UIImage(named: "img_clear_night") ?? UIImage()
        case .cloudy: return UIImage(named: "img_cloudy") ?? UIImage()
        case .lotCloudDay: return UIImage(named: "img_lotcloud_day") ?? UIImage()
        case .lotCloudNight: return UIImage(named: "img_lotcloud_night") ?? UIImage()
        case .shower: return UIImage(named: "img_shower") ?? UIImage()
        case .lightRain: return UIImage(named: "img_lightrain") ?? UIImage()
        case .rain: return UIImage(named: "img_rain") ?? UIImage()
        case .rainSnow: return UIImage(named: "img_rainsnow") ?? UIImage()
        case .lightSnow: return UIImage(named: "img_lightsnow") ?? UIImage()
        case .snowDrifting: return UIImage(named: "img_snowdrifting") ?? UIImage()
        case .snow: return UIImage(named: "img_heavysnow") ?? UIImage()
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

struct DetailTemp {
    let date: String
    let time: String
    let temperature: Int
    let day: Bool
    let image: String
}

