//
//  CheckButton.swift
//  ShortWeather
//
//  Created by KJ on 2023/01/07.
//

enum ButtonState {
    case allow
    case notAllow
}

import UIKit

class CheckButton: UIButton {
    
    private let buttonName: String
    private let buttonState: ButtonState
    
    init(buttonName: String, buttonState: ButtonState) {
        self.buttonName = buttonName
        self.buttonState = buttonState
        super.init(frame: .zero)
        setUIButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUIButton() {
        setTitle(buttonName, for: .normal)
        layer.cornerRadius = 15
        titleLabel?.font = .fontGuide(.subhead2)
        switch buttonState {
        case .allow:
            allowButton()
        case.notAllow:
            notAllowButton()
        }
    }
    
    func allowButton() {
        setTitleColor(Color.white, for: .normal)
        backgroundColor = Color.pointColor
    }
    
    func notAllowButton() {
        setTitleColor(Color.black, for: .normal)
        backgroundColor = Color.gray2
    }
    
    override var intrinsicContentSize: CGSize {
        let size = UIScreen.main.bounds.width - 56
        return CGSize(width: size, height: 57)
    }
}
