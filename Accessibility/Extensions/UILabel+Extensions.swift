//
//  UILabel+Extensions.swift
//  Accessibility
//
//  Created by Juan David Cruz Serrano on 12/8/18.
//  Copyright © 2018 Juan David Cruz Serrano. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
    public var requiredHeight: CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.attributedText = attributedText
        label.sizeToFit()
        return ceil(label.frame.height)
    }
}
