//
//  UILabel+Localized.swift
//  Test
//
//  Created by admin on 4/16/20.
//  Copyright © 2020 testing. All rights reserved.
//

import UIKit

extension UILabel {
    
    @IBInspectable
    var localizationKey: String {
        get {
            return ""
        }
        set {
            text = newValue.localized
        }
    }
    
    
}
