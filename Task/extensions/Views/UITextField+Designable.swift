//
//  UITextField+Helper.swift
//  Test
//
//  Created by admin on 4/15/20.
//  Copyright © 2020 testing. All rights reserved.
//

import UIKit
import MOLH

fileprivate let bottomLineTag : Int = 999

extension UITextField {
    
    /**
     *** 1- corner raduis
     *** 2- clipping
     *** 3- masking
     *** 4- border (width - color )
     *** 5- set placeholder ( string, color )
     *** 7- set background color
     *** 8- set text ( string, color )
     *** 9- set bottom line ( color, height )
     *** 9- set shadow ( color, opacity, raduis, offset )
     *** 10- set icon
     *** 11- set padding.
     *** 12- CLEAR VIEW.
     */
    
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        guard self.textAlignment != .center else { return }
        if MOLHLanguage.currentAppleLanguage() == "ar" {
            self.textAlignment = .right
        } else {
            self.textAlignment = .left
        }
    }
    
    /**
     *******
     * ------- FOR FASTER USER ------------
     *
     .set(iconView: "", padding: 12)
     .set(placeholder: "")
     .set(border: .none)
     .set(border: 1)
     .set(border: .black)
     .set(rounded: true)
     *
     *******
     */
    
    
    /**
     *** mark:- set textfield border raduis easily
     *--------------------------------------------------------
     *&&-------
     *&& set border width through UIVIEW
     *&& set border color through UIVIEW
     *&& set border style
     *&&-----
     *--------------------------------------------------------
     */

    internal func set(border style: BorderStyle) -> UITextField {
        self.borderStyle = style
        return self
    }
    
    /**
     *** mark:- set textfield placeholder prop
     *--------------------------------------------------------
     *&&------- placeholder title
     *&& string title inside the textField .
     *&&------- placeholder color
     *&& string title color inside the textField .
     *--------------------------------------------------------
     */
    
    internal func set(placeholder text: String) -> UITextField {
        self.placeholder = text
        return self
    }
    
    /** this function depends on function in line 107 ****/
    
    internal func set(placeholder color: UIColor) -> UITextField {
        let placeholderTitle = self.placeholder ?? ""
        self.attributedPlaceholder = NSAttributedString(
            string: placeholderTitle, attributes: [NSAttributedString.Key.foregroundColor: color]
        )
        return self
    }
    
    
    /**
     *** mark:- set textfield text (color, string) easily
     *--------------------------------------------------------
     *&&-------
     *&& set text string
     *&& set text color .
     *&&-----
     *--------------------------------------------------------
     */
    
    
    internal func set(text string: String) -> UITextField {
        self.text = string
        return self
    }
    
    internal func set(text color: UIColor) -> UITextField {
        self.textColor = color
        return self
    }
    
    
    /**
     *** mark:- set textfield icon props
     *--------------------------------------------------------
     *&&------- set icon view
     *&&------- set padding without image
     *
     *--------------------------------------------------------
     */
    
    internal func set(iconView icon: String, padding: CGFloat) -> UITextField {
        let iconImageViewHeight: CGFloat = 24
        let iconImageViewYPos: CGFloat = 0 //CGFloat(self.frame.height / 2) - CGFloat( iconImageViewHeight / 2 )
        let iconImageViewWidth: CGFloat = 24
        let iconImageViewXPos: CGFloat = padding
        let iconImage = UIImage(named: icon)
        let iconImageView = UIImageView(image: iconImage)
        iconImageView.frame = CGRect(x: iconImageViewXPos, y: iconImageViewYPos, width: iconImageViewWidth, height: iconImageViewHeight)
        let outterViewYPos = (self.frame.height - iconImageViewHeight) / 2
        let outterViewWidth = iconImageViewWidth + ( padding * 2 )
        let outterView = UIView(frame: CGRect(x: 0, y: outterViewYPos, width: outterViewWidth, height: iconImageViewHeight))
        outterView.addSubview(iconImageView)
        self.leftView = outterView
        self.leftViewMode = .always
        return self
    }
    
    internal func set(padding: CGFloat) -> UITextField {
        let hidenView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.height))
        self.leftView = hidenView
        self.rightView = hidenView
        self.leftViewMode = .always
        self.rightViewMode = .always
        return self
    }
    
}


private var __maxLengths = [UITextField: Int]()
extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        if let t = textField.text {
            textField.text = String(t.prefix(maxLength))
        }
    }
}
