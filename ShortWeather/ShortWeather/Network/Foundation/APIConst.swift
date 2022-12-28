//
//  APIConst.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2022/12/28.
//

import Foundation

enum APIConstants {
    
    enum NetworkHeaderKey: String {
        case accessToken = "accesstoken"
        case contentType  = "Content-Type"
    }

    static let authorization: String = "Authorization"
    static let accept: String = "Accept"
    static let auth: String = "x-auth-token"
    static let contentType: String = "Content-Type"
    static let applicationJSON: String = "application/json"
    
    static var headerWithNoToken: [String: String] {
        [NetworkHeaderKey.contentType.rawValue: APIConstants.applicationJSON]
    }
}
