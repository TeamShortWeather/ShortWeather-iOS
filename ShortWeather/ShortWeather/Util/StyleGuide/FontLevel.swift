//
//  FontGuide.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2022/12/29.
//

import Foundation

public enum FontLevel {
    
    case display1           // 32pt / semibold
    
    case headline1          // 24pt / semibold
    case headline2          // 20pt / semibold
    
    case subhead1           // 20pt / medium
    case subhead2           // 16pt / semibold
    case subhead3           // 14pt / semibold
    case subhead4           // 16pt / bold
    
    case body1              // 16pt / regular
    case body2              // 14pt / regular
    
    case caption1           // 12pt / regular
    case caption2           // 12pt / semibold
    
    case weather1           // 70pt / regular
    case weather2           // 16pt / regular
}

extension FontLevel {
    
    public var fontWeight: String {
        switch self {
            
        case .display1:
            return PretendardType.semibold.rawValue
        case .headline1:
            return PretendardType.semibold.rawValue
        case .headline2:
            return PretendardType.semibold.rawValue
        case .subhead1:
            return PretendardType.medium.rawValue
        case .subhead2:
            return PretendardType.semibold.rawValue
        case .subhead3:
            return PretendardType.semibold.rawValue
        case .subhead4:
            return PretendardType.bold.rawValue
        case .body1:
            return PretendardType.regular.rawValue
        case .body2:
            return PretendardType.regular.rawValue
        case .caption1:
            return PretendardType.regular.rawValue
        case .caption2:
            return PretendardType.semibold.rawValue
        case .weather1:
            return PretendardType.regular.rawValue
        case .weather2:
            return PretendardType.regular.rawValue
        }
    }
    
    public var fontSize: CGFloat {
        switch self {

        case .display1:
            return 32
        case .headline1:
            return 24
        case .headline2:
            return 20
        case .subhead1:
            return 20
        case .subhead2:
            return 16
        case .subhead3:
            return 14
        case .subhead4:
            return 16
        case .body1:
            return 16
        case .body2:
            return 14
        case .caption1:
            return 12
        case .caption2:
            return 12
        case .weather1:
            return 70
        case .weather2:
            return 16
        }
    }
}
