//
//  FirstTodayWeatherData.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/06.
//

import UIKit

enum ReportType {
    case none
    case hot
    case cold
    case dust
}

enum DustStateType {
    case good
    case normal
    case bad
    case worst
}

enum DustType: String{
    case dust = "미세"
    case fineDust = "초미세"
}


struct FirstTodayWeatherData {
    let compareTemp: String
    let compareWeather: String
    let mainReport: String
    let mainReportType: ReportType
    let dustReport: DustStateType
    let fineDustReport: DustStateType
    let weatherImage: UIImage
    let weathehr: String
    let lowestTemp: String
    let presentTemp: String
    let highestTemp: String
    let todayWeather: String
    let yesterdayWeather: String
    
    //MARK: - Dumy Data
    
    public static func dumyData() -> FirstTodayWeatherData {
        return FirstTodayWeatherData(compareTemp: "어제보다 -2",
                                     compareWeather: "어제보다 더워요",
                                     mainReport: "한파 특보",
                                     mainReportType: .cold,
                                     dustReport: .good,
                                     fineDustReport: .bad,
                                     weatherImage: Image.imgFog,
                                     weathehr: "구름 많음",
                                     lowestTemp: "-12",
                                     presentTemp: "10",
                                     highestTemp: "10",
                                     todayWeather: "강풍으로 모자가 날라갈 수도 있어요 가나라다",
                                     yesterdayWeather: "어제 -19로\n 함박눈이 펑펑왔어요 가나다라마바사")
    }
}
