//
//  CheckButton.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/07.
//

import UIKit

enum CheckButtonState {
    case allow
    case notAllow
}

final class CheckButton: UIButton {
    
    // MARK: - Initializer
    
    init() {
        super.init(frame: .zero)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components Property
    
    func setUI() {
        layer.cornerRadius = 15
        titleLabel?.font = .fontGuide(.subhead2)
        setState(.notAllow)
    }
    
    // MARK: - Methods
    
    public func setState(_ state: CheckButtonState) {
        if state == .allow {
            setTitleColor(Color.white, for: .normal)
            backgroundColor = Color.pointColor
            isUserInteractionEnabled = true
        } else {
            setTitleColor(Color.black, for: .normal)
            backgroundColor = Color.gray2
            isUserInteractionEnabled = false
        }
    }
}
