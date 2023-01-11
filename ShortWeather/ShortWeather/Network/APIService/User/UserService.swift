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
    case postUser(body: String)
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
        case .postUser(let body):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return APIConstants.header
    }
    
    
}
