//
//  UITextField+Localized.swift
//  Test
//
//  Created by admin on 4/16/20.
//  Copyright © 2020 testing. All rights reserved.
//

import UIKit

extension UITextField {
    
    @IBInspectable
    var localizationPlaceholderKey: String {
        get {
            return ""
        }
        set {
            set(placeholder: newValue.localized).clear()
        }
    }
    
}
