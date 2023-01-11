//
//  URLConst.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2022/12/28.
//

import Foundation

public enum URLConst {
    
    //MARK: - Base URL
    
//    public static let baseURL = "54.180.113.172:8000"
    public static let baseURL = "http://54.180.198.102:8000"
    
    //MARK: - URL Path
    
    public static let checkUserURL = "/auth/login"
    public static let postUserURL = "/auth"
    public static let getTodayWeatherURL = "/weather/today"
    public static let getTodayWeatherQuestionURL = "/weather/today/question"
    public static let getDetailTodayWeatherURL = "/weather/today/detail"
    public static let getDetailTempTodayWeatherURL = "/weather/today/detail/temp"
    public static let getDetailRainTodayWeatherURL = "/weather/today/detail/rain"
    public static let postSetWakeupURL = "/setting/wakeup"
    public static let postSetCommuteURL = "/setting/commute"
}
