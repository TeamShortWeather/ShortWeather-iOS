//
//  APIConst.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2022/12/28.
//

import Foundation

enum NetworkHeaderKey: String {
    case deviceToken = "deviceToken"
    case accessToken = "accesstoken"
    case contentType = "Content-Type"
    case authorization = "Authorization"
}

enum APIConstants {
    
    static let accept: String = "Accept"
    static let auth: String = "x-auth-token"
    static let applicationJSON = "application/json"
    //    static let contentType: String = "Content-Type"
    
    
    static let testDeviceToken: String = ""
    static let jwtToken: String = ""
    
    
    static var headerWithNoToken: [String: String] {
        [NetworkHeaderKey.contentType.rawValue: APIConstants.applicationJSON]
    }
    
    
    //MARK: - Header
    
    static var header: [String: String] {
        [NetworkHeaderKey.contentType.rawValue: APIConstants.applicationJSON]
    }
    
    static var headerWithOutToken: [String: String] {
        [
            NetworkHeaderKey.contentType.rawValue: APIConstants.applicationJSON,
        ]
    }
    
    static var headerWithDeviceToken: [String: String] {
        [
            NetworkHeaderKey.contentType.rawValue: APIConstants.applicationJSON,
            NetworkHeaderKey.deviceToken.rawValue: APIConstants.testDeviceToken
        ]
    }
    
    static var headerWithAuthorization: [String: String] {
        [
            NetworkHeaderKey.contentType.rawValue: APIConstants.applicationJSON,
            NetworkHeaderKey.authorization.rawValue: APIConstants.jwtToken
        ]
    }
}
