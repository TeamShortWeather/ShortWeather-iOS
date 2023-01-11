//
//  User.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/11.
//

import Foundation

struct User {
    var gender: String
    var age: String
    var tempSens: String
    var wakeUpTime: String
    var goOutTime: String
    var goHomeTime: String
    var deviceToken: String
    
    public func makePostUserRequest() -> PostUserRequest {
        return PostUserRequest(gender: gender,
                               age: age,
                               tempSens: tempSens,
                               wakeUpTime: wakeUpTime,
                               goOutTime: goOutTime,
                               goHomeTime: goHomeTime,
                               deviceToken: deviceToken)
    }
}
