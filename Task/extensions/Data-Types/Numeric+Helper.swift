//
//  Double+Helper.swift
//  Test
//
//  Created by admin on 4/16/20.
//  Copyright © 2020 testing. All rights reserved.
//

import Foundation

extension Double {
    
    /// Rounds the double to decimal places value
    internal func rounded(places to:Int) -> Double {
        let divisor = pow(10.0, Double(to))
        return (self * divisor).rounded() / divisor
    }
    
    internal func convertToString() -> String {
        return String(self)
    }
    
}

extension Float {
    
    /// Rounds the float to decimal places value
    internal func rounded(toPlaces places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
    
    internal func convertToString() -> String {
        return String(self)
    }
    
}

extension Int {
    
    internal func convertToString() -> String {
        return String(self)
    }
    
}
