//
//  FirstTodayWeatherData.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/06.
//

import UIKit

struct FirstTodayWeatherData {
    let compareTemp: String
    let compareWeather: String
    let reportCollection: [String]
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
                                                      reportCollection: ["폭염 특보, 미세, 초미세"],
                                     weatherImage: Image.imgFog,
                                                      weathehr: "구름 많음",
                                                      lowestTemp: "-12",
                                                      presentTemp: "10",
                                                      highestTemp: "10",
                                                      todayWeather: "강풍으로 모자가 날라갈 수도 있어요 가나라다",
                                                      yesterdayWeather: "어제 -19로\n 함박눈이 펑펑왔어요 가나다라마바사")
    }
}
