//
//  String.swift
//  olibiya
//
//  Created by admin on 11/4/19.
//  Copyright © 2019 d-development.olibiya. All rights reserved.
//

import UIKit

extension String {
    
    
    /**
     *** 1- localized
     *** 2- convert to int
     *** 3- convert to double
     *** 4- convert to float
     */
    
    
    /**
     *******
     * ------- FOR FASTER USER ------------
     *
     .convertToInt()
     *
     *******
     */
    
    
    /**
     *** mark:- convert from lang to other lang
     *--------------------------------------------------------
     *&&-------
     *&& .localized
     *&&-----
     *--------------------------------------------------------
     */
    
    internal var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    /**
     *** mark:- convert from self to NUMBERIC
     *--------------------------------------------------------
     *&&-------
     *&& convet to int ( validate first )
     *&& convet to float ( validate first )
     *&& convet to dou ( validate first )
     *&&-----
     *--------------------------------------------------------
     */
    
    public var intVal: Int {
        return self.convert().integerValue
    }
    
    public var floatVal: Float {
        return self.convert().floatValue
    }
    
    public var doubleVal: Double {
        return self.convert().doubleValue
    }
    
    public var boolVal: Bool {
        return self.convert().boolValue
    }
    
    /**
     *** mark:- convert from lang to other lang
     *--------------------------------------------------------
     *&&-------
     *&& .isTrue number
     *&& if YES then convert to NSString .
     *&& if NO then trigger an error .
     *&&-----
     *--------------------------------------------------------
     */
    
    private func convert() -> NSString {
        if !isTrueNumber() {
            fatalError("The string does not contain number \(self)")
        }
        return (self as NSString)
    }
    
    private func isTrueNumber() -> Bool {
        let numberRegEx = "^[-0-9.]{1,}"
        let numberPred = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return numberPred.evaluate(with: self)
    }
    
    internal var width: CGFloat {
        let size = (self as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont(name: "Cairo-Regular", size: 17.0)!])
        return size.width
    }
    
    
}

