//
//  TimezonePrecipitationData.swift
//  ShortWeather
//
//  Created by 김민 on 2023/01/10.
//

import UIKit

enum TimezonePrecipitationType: Int  {
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
    
    func setPrecipitationImage() -> UIImage {
        switch self {
        case .zero: return UIImage(named: "icn_precipitation_1") ?? UIImage()
        case .ten: return UIImage(named: "icn_precipitation_2") ?? UIImage()
        case .twenty: return UIImage(named: "icn_precipitation_3") ?? UIImage()
        case .thirty: return UIImage(named: "icn_precipitation_4") ?? UIImage()
        case .fourty: return UIImage(named: "icn_precipitation_5") ?? UIImage()
        case .fifty: return UIImage(named: "icn_precipitation_6") ?? UIImage()
        case .sixty: return UIImage(named: "icn_precipitation_7") ?? UIImage()
        case .seventy: return UIImage(named: "icn_precipitation_8") ?? UIImage()
        case .eighty: return UIImage(named: "icn_precipitation_9") ?? UIImage()
        case .ninety: return UIImage(named: "icn_precipitation_10") ?? UIImage()
        }
    }
}

struct TimezonePrecipitationData {
    let date: String
    let time: String
    let rain: Int
}
