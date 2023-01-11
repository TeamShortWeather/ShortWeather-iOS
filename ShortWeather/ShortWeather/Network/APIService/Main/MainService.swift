//
//  MainService.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2022/12/28.
//

import Foundation
import Moya

enum MainService {
    case getexample
}

extension MainService: TargetType {
    var baseURL: URL {
        return URL(string: URLConst.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getexample:
            return URLConst.checkUserURL
        }
    }
    
    var method: Moya.Method {
        switch self {
            
        case .getexample:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
            
        case .getexample:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getexample:
            return APIConstants.headerWithNoToken
        }
    }
    
    
}
