//
//  TimezonePrecipitationData.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/10.
//

import UIKit

enum TimezonePrecipitationType: Int {
    case zero = 0
    case ten = 10
    case twenty = 20
    case thirty = 30
    case fourty = 40
    case fifty = 50
    case sixty = 60
    case seventy = 70
    case eighty = 80
    case ninety = 90
    
    func setPrecipitationImage() -> String {
        switch self {
        case .zero: return "icn_precipitation_1"
        case .ten: return "icn_precipitation_2"
        case .twenty: return "icn_precipitation_3"
        case .thirty: return "icn_precipitation_4"
        case .fourty: return "icn_precipitation_5"
        case .fifty: return "icn_precipitation_6"
        case .sixty: return "icn_precipitation_7"
        case .seventy: return "icn_precipitation_8"
        case .eighty: return "icn_precipitation_9"
        case .ninety: return "icn_precipitation_10"
        }
    }
}

struct TimezonePrecipitationData {
    let date: String
    let time: String
    let rain: Int
    
    public static func dummyData() -> [TimezonePrecipitationData] {
        return [TimezonePrecipitationData(date: "20230110",
                                          time: "0200",
                                          rain: 0),
                 TimezonePrecipitationData(date: "20230110",
                                            time: "0500",
                                            rain: 20),
                TimezonePrecipitationData(date: "20230110",
                                           time: "1700",
                                           rain: 30),
                TimezonePrecipitationData(date: "20230110",
                                           time: "1800",
                                           rain: 40),
                TimezonePrecipitationData(date: "20230110",
                                           time: "2100",
                                           rain: 90)
                ]
    }
}
