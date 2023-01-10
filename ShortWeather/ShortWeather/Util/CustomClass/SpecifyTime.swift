//
//  SpecifyTime.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/09.
//

import UIKit

class SpecifyTime: UIPickerView {
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components Property
    
    func setUI() {
        numberOfComponents(in: 2)
        
    }
}
