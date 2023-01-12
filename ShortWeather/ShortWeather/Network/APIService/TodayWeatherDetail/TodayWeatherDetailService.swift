//
//  WeatherService.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/11.
//

import Foundation
import Moya

enum TodayWeatherDetailService {
    case fetchWeatherDetail
    case fetchDetailTemp
    case fetchDetailRain
}

extension TodayWeatherDetailService: TargetType {
    var baseURL: URL {
        return URL(string: URLConst.baseURL)!
    }
    
    var path: String {
        switch self {
        case .fetchWeatherDetail:
            return URLConst.getDetailTodayWeatherURL
        case .fetchDetailTemp:
            return URLConst.getDetailTempTodayWeatherURL
        case .fetchDetailRain:
            return URLConst.getDetailRainTodayWeatherURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchWeatherDetail:
            return .get
        case .fetchDetailTemp:
            return .get
        case .fetchDetailRain:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchWeatherDetail:
            return .requestPlain
        case .fetchDetailTemp:
            return .requestPlain
        case .fetchDetailRain:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .fetchWeatherDetail:
            return APIConstants.headerWithAuthorization
        case .fetchDetailTemp:
            return APIConstants.headerWithOutToken
        case .fetchDetailRain:
            return APIConstants.headerWithOutToken
        }
    }
}
