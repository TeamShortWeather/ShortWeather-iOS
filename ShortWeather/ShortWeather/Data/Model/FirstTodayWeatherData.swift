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


//struct FirstTodayWeatherData {
//    let compareTemp: String
//    let compareWeather: String
//    let mainReport: String
//    let mainReportType: ReportType
//    let dustReport: DustStateType
//    let fineDustReport: DustStateType
//    let weatherImage: UIImage
//    let weather: String
//    let lowestTemp: String
//    let presentTemp: String
//    let highestTemp: String
//    let todayWeather: String
//
//    //MARK: - Dumy Data
//
////    public static func dumyData() -> FirstTodayWeatherData {
////        return FirstTodayWeatherData(compareTemp: "어제보다 \((-2).temperature)",
////                                     compareWeather: "어제보다 추워요",
////                                     mainReport: "한파 특보",
////                                     mainReportType: .cold,
////                                     dustReport: .good,
////                                     fineDustReport: .bad,
////                                     weatherImage: Image.imgClearDay,
////                                     weathehr: "구름 많음",
////                                     lowestTemp: (-12).temperature,
////                                     presentTemp: (-10).temperature,
////                                     highestTemp: (10).temperature,
////                                     todayWeather: "강풍으로 모자가 날라갈 수도 있어요 가나라다",
////                                     yesterdayWeather: "어제 \((-19).temperature)로\n 함박눈이 펑펑왔어요 가나다라마바사")
////    }
//}
