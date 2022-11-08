//
//  UIView+Designable.swift
//  Test
//
//  Created by admin on 4/15/20.
//  Copyright © 2020 testing. All rights reserved.
//

import UIKit

fileprivate let bottomLineTag : Int = 999

extension UIView {
    
    
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
    
    /**
     *** mark:- set textfield corner raduis easily
     *--------------------------------------------------------
     *&&-------
     *&& set corner raduis through layer
     *&&-----
     *--------------------------------------------------------
     */
    
    internal func set(corner raduis: CGFloat, disable maskToBounds: Bool = false) -> UIView {
        self.layer.cornerRadius = raduis
        self.layer.masksToBounds = !maskToBounds
        return self
    }
    
    
    internal func set(rounded corner: Bool = true) -> UIView {
        let cornerHeight = self.frame.height / 2
        return set(corner: cornerHeight)
    }
    
    
    /**
     *** mark:- set textfield corner raduis FROM SPECIFIC CORNERS
     *---------------------------------------------------------------
     *&&-------
     *&& set corner raduis through layer [left, right, top, bottom]
     *&&-----
     *---------------------------------------------------------------
     */
    
    internal func set(corners: UIRectCorner, radius: CGFloat) -> UIView {
        self.layoutIfNeeded()
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        return self
    }
    
    
    
    /**
     *** mark:- set textfield clipToBounds prop
     *--------------------------------------------------------
     *&&------- in case it set to YES
     *&& means that any inner views will respect the view frame |
     *&& also means that if the inner view X or Y position should be inside of the parent view ....
     *&&----- in case it set to NO
     *&& means that any inner views will not respect the view frame |
     *&& also means that if the inner view X or Y position should not be inside of the parent view ....
     *--------------------------------------------------------
     */
    
    internal func set(clipping: Bool) -> UIView {
        self.clipsToBounds = clipping
        return self
    }
    
    
    /**
     *** mark:- set textfield clipToBounds prop
     *--------------------------------------------------------
     *&&------- in case it set to YES
     *&& means that any inner views will respect the view frame |
     *&& also means that if the inner view X or Y position should be inside of the parent view ....
     *&&----- in case it set to NO
     *&& means that any inner views will not respect the view frame |
     *&& also means that if the inner view X or Y position should not be inside of the parent view ....
     *--------------------------------------------------------
     */
    
    internal func set(masking: Bool) -> UIView {
        self.layer.masksToBounds = masking
        return self
    }
    
    /**
     *** mark:- set textfield border raduis easily
     *--------------------------------------------------------
     *&&-------
     *&& set border width through layer
     *&& set border color through layer
     *&&-----
     *--------------------------------------------------------
     */
    
    internal func set(border width: CGFloat) -> UIView {
        self.layer.borderWidth = width
        return self
    }
    
    internal func set(border color: UIColor) -> UIView {
        self.layer.borderColor = color.cgColor
        return self
    }
    
    
    /**
     *** mark:- set textfield background color easily
     *--------------------------------------------------------
     *&&-------
     *&& set background color
     *&&-----
     *--------------------------------------------------------
     */
    
    internal func set(background color: UIColor) -> UIView {
        self.backgroundColor = color
        return self
    }
    
    
    
    /**
     *** mark:- set textfield bottom line ( width , color ) easily
     *--------------------------------------------------------
     *&&-------
     *&& set bottom line width
     *&& in case it setted twice in the second time it will be removed......
     *&& set bottom line color
     *&&-----
     *--------------------------------------------------------
     */
    
    internal func set(bottomLine height: CGFloat) -> UIView {
        if let subView = self.viewWithTag(bottomLineTag) {
            subView.removeFromSuperview()
            return self
        }
        let bottomView = UIView(frame: CGRect(x: 0, y: self.frame.height - height, width: self.frame.width, height: height))
        bottomView.tag = bottomLineTag
        bottomView.autoresizingMask = .flexibleWidth
        self.addSubview(bottomView)
        return self
    }
    
    internal func set(bottomLine color: UIColor) -> UIView {
        self.viewWithTag(bottomLineTag)?.backgroundColor = color
        return self
    }
    
    
    
    /**
     *** mark:- set textfield shadow props
     *--------------------------------------------------------
     *&&------- shadow opacity
     *&&------- shadow raduis
     *&&------- shadow color
     *&&------- shadow opacity
     *
     *--------------------------------------------------------
     */
    
    
    internal func set(shadowOpacity: Float) -> UIView {
        self.layer.shadowOpacity = shadowOpacity
        return self
    }
    
    
    internal func set(shadowRaduis: CGFloat) -> UIView {
        self.layer.shadowRadius = shadowRaduis
        return self
    }
    
    internal func set(shadowColor: UIColor) -> UIView {
        self.layer.shadowColor = shadowColor.cgColor
        return self
    }
    
    internal func set(shadowOffset width: CGFloat, height: CGFloat) -> UIView {
        self.layer.shadowOffset = CGSize(width: width, height: height)
        return self
    }
    
    
    internal func clear() -> Void {
        return
    }
    
    
    internal func setShadow() {
        self
        .set(corner: 12)
        .set(masking: false)
        .set(shadowRaduis: 2)
        .set(shadowColor: .gray)
        .set(shadowOpacity: 0.225)
        .set(shadowOffset: 0, height: 1)
        .clear()
    }
    
    
}
