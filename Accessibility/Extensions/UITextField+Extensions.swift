//
//  UITextField+Extensions.swift
//  Accessibility
//
//  Created by Juan David Cruz Serrano on 12/7/18.
//  Copyright © 2018 Juan David Cruz Serrano. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}
