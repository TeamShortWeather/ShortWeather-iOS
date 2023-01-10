//
//  datePickerTest.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/09.
//

import UIKit

class DatePickerTest: UIView {
    
    // pickerView 에 담고 싶은 정보를 배열로 표현했다.
    let numbersString: [String] = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight"]
    let numbers: [String] = ["1", "2", "3", "4", "5", "6", "7", "8"]
    
    // UIPickerViewDelegate, UIPickerViewDatsSource 프로토콜을 구현해줘야 한다.
    
    // pickerView에 표현하고 싶은 아이템의 갯수
    // 각각의 component 마다 다른 값을 갖게 한다.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return numbersString.count
        } else {
            return numbers.count
        }
    }
    
    // pickerView에서 특정 아이템을 선택했을 때의 행위
    // 각각의 component 마다 다른 값을 갖게 한다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            label.text = numbersString[row]
        } else {
            numberLabel.text = numbers[row]
        }
    }
    
    // pickerView에서 보여주고 싶은 아이템의 제목
    // 각각의 component 마다 다른 값을 갖게 한다.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return numbersString[row]
        } else {
            return numbers[row]
        }
    }
    
    // pickerView에 담긴 아이템의 컴포넌트 갯수
    // pickerView는 여러 개의 wheel이 있을 수 있다.
    // 여기서는 2개의 wheel을 가진 pickerView를 표현했다.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    private let label: UILabel!
    private let numberLabel: UILabel!
    private let pickerView: UIPickerView!
    
    init() {
        super.init(frame: .zero)
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.numberOfRows(inComponent: 60)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DatePickerTest: UIPickerViewDelegate {
    
}

extension DatePickerTest: UIPickerViewDataSource {
    
}
