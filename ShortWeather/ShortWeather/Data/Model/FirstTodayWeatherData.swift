//
//  FirstTodayWeatherData.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/06.
//

import UIKit

enum Report: String {
    case heat = "폭염특보"
    case heavySnow = "대설특보"
    case coldWave = "한파특보"
    case stormSurge = "폭풍해일특보"
    case typhoon = "태풍특보"
    case heavyRain = "호우특보"
    case gale = "강풍특보"
    case windVolum = "풍량특보"
    case yellowDust = "황사특보"
    case fineDust = "미세먼지특보"
    case dry = "건조특보"
    
    func setReportType() -> ReportType {
        switch self {
        case .heat:
            return .hot
        case .heavySnow, .coldWave, .stormSurge, .typhoon, .heavyRain, .gale, .windVolum:
            return .cold
        case .yellowDust, .fineDust, .dry:
            return .dust
        default:
            return .none
        }
    }
}

enum ReportType {
    case none
    case hot
    case cold
    case dust
}

enum DustStateType: Int {
    case good = 1
    case normal = 2
    case bad = 3
    case worst = 4
}

enum DustType: String{
    case dust = "미세"
    case fineDust = "초미세"
}
