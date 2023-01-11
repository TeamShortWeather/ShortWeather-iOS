//
//  WeatherService.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/11.
//

import Foundation
import Moya

enum TodayWeatherService {
    case fetchWeather
    case fetchWeatherQuestion
}

extension TodayWeatherService: TargetType {
    var baseURL: URL {
        return URL(string: URLConst.baseURL)!
    }
    
    var path: String {
        switch self {
        case .fetchWeather:
            return URLConst.getTodayWeatherURL
        case .fetchWeatherQuestion:
            return URLConst.getTodayWeatherQuestionURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchWeather:
            return .get
        case .fetchWeatherQuestion:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchWeather:
            return .requestPlain
        case .fetchWeatherQuestion:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .fetchWeather:
            return APIConstants.headerWithAuthorization
        case .fetchWeatherQuestion:
            return APIConstants.headerWithAuthorization
        }
    }
}
