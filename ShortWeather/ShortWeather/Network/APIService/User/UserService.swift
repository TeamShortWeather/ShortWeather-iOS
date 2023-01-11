//
//  InfoService.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/11.
//

import Foundation
import Moya

enum UserService {
    case checkUser
    case postUser(param: PostUserRequest)
}

extension UserService: TargetType {
    var baseURL: URL {
        return URL(string: URLConst.baseURL)!
    }
    
    var path: String {
        switch self {
        case .checkUser:
            return URLConst.checkUserURL
        case .postUser:
            return URLConst.postUserURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .checkUser:
            return .get
        case .postUser:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .checkUser:
            return .requestPlain
        case .postUser(let param):
            return .requestParameters(parameters: try! param.asParameter(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .checkUser:
            return APIConstants.headerWithDeviceToken
        case .postUser(param: let param):
            return APIConstants.headerWithOutToken
        }
    }
}
