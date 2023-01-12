//
//  Letters.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/03.
//

import Foundation

public enum Letter {

    //MARK: - Tab Title
    
    public static let todayWeather = "오늘 날씨"
    public static let weekWeather = "주간 날씨"
    public static let cloth = "옷"
    public static let setting = "설정"

    public static let dust = "미세"
    public static let fineDust = "초미세"
    
    public static let outTime = "외출 시간"
    public static let inTime = "귀가 시간"
    public static let wakeUpTime = "기상 시간"
    
    public static let hourWeather = "시간대별 날씨"
    public static let weather = "날씨"
    public static let precipitation = "강수"
    
    public static let todayWeatherInfo = "오늘 날씨 정보"
    public static let humidityInfo = "습도"
    public static let sunInfo = "일출/일몰"
    public static let dustInfo = "미세먼지"
    public static let fineDustInfo = "초미세먼지"
    
    public static let commuteTime = "외출 / 귀가시간대"
    public static let alarm = "알림"
    
    public static let changeHour = "시간대를 변경해 주세요"
    public static let changeAlarm = "알림 받을 시간대를\n설정해 주세요"
    public static let changeWakeUpTime = "기상시간을 변경해 주세요"

    public static let allAlarm = "전체 알림"
    public static let allAlarmDescription = "날씨 정보를 알려드려요"
    public static let wakeUpTimeAlarm = "기상시간대"
    public static let wakeUpTimeAlarmDescription = "기상시간에 맞춰서 날씨를 알려드려요"
    public static let bedtimeAlarm = "취침시간대"
    public static let bedtimeAlarmDescription = "취침시간에 맞춰서 날씨를 알려드려요"
    public static let newsAlarm = "특보"
    public static let newsAlarmDescription = "실시간 날씨 특보를 알려드려요"
    
    public static let explainPurposeInfo = "* 입력한 시간을 바탕으로 날씨를 알려드려요"
    
}

extension Letter {
    
    //MARK: - Temporary Letter
    
    public static let tempLocation = "서울, 중구 명동"
}
