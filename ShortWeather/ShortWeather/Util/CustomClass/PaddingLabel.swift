//
//  PaddingLabel.swift
//  ShortWeather
//
//  Created by Mac Book Pro on 2023/01/06.
//

import UIKit

final class PaddingLabel: UILabel {
    
    // MARK: - Properties

    @IBInspectable var topInset: CGFloat
    @IBInspectable var bottomInset: CGFloat
    @IBInspectable var leftInset: CGFloat
    @IBInspectable var rightInset: CGFloat
    
    // MARK: - Initializer
    
    init(topInset: CGFloat, bottomInset: CGFloat, leftInset: CGFloat, rightInset: CGFloat) {
        self.topInset = topInset
        self.bottomInset = bottomInset
        self.leftInset = leftInset
        self.rightInset = rightInset
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset, height: size.height + topInset + bottomInset)
    }
    
    override var bounds: CGRect {
        didSet { preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset) }
    }
}

