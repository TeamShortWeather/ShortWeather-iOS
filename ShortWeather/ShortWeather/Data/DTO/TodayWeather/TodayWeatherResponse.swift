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
//    var reportType: ReportType {
//        get {
//            if breakingNews == "폭염특보" {
//                return .hot
//            } else if breakingNews == "대설특보" || breakingNews == "한파특보" || breakingNews == "폭풍해일특보" || breakingNews == "태풍특보" || breakingNews == "호우특보" || breakingNews == "강풍특보" || breakingNews == "풍량특보" {
//                return .cold
//            } else if breakingNews == "황사특보" || breakingNews == "미세먼지특보" || breakingNews == "건조특보" {
//                return .dust
//            } else {
//                return .none
//            }
//        }
//    }
    let fineDust, ultrafineDust: Int
    let day: Bool
    let image: String
    let currentTemp, minTemp, maxTemp: Int
    let weatherMessage: String
}
