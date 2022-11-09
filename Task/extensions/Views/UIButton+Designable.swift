//
//  UIButton+Designable.swift
//  Test
//
//  Created by admin on 4/15/20.
//  Copyright © 2020 testing. All rights reserved.
//

import UIKit
import MOLH
//import MBRadioCheckboxButton

extension UIButton {
    
    
    /**
     *** 1- setTitle
     *** 2- setImage
     *** 3- space between image & title
     *** 4- content mode
     */
    
    
    /**
     *******
     * ------- FOR FASTER USER ------------
     *
     .set(image: "")
     .set(spaceBetweenTitle_Icon: 5) -> [ 5 means 10 ]
     .set(rounded: true)
     .set(shadowColor: .red)
     .set(shadowRaduis: 2)
     .set(shadowOpacity: 0.225)
     .set(shadowOffset: 1, height: 0)
     .set(masking: false)
     .clear()
     *
     *******
     */
    
    
    open override func awakeFromNib() {
        super.awakeFromNib()
//        guard (self is RadioButton || self is CheckboxButton ) && MOLHLanguage.currentAppleLanguage() == "ar" else { return }
//        self.transform = CGAffineTransform(scaleX: -1, y: 1)
//        self.titleLabel?.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    
    /**
     *** mark:- set textfield title & image easily
     *--------------------------------------------------------
     *&&-------
     *&& set Title with normal case
     *&& set backgeound iMage with normal case
     *&& set Image with normal case
     *&&-----
     *--------------------------------------------------------
     */
    
    internal func set(title to: String) -> UIButton {
        self.setTitle(to, for: .normal)
        return self
    }
    
    internal func set(backGroundImage to: String) -> UIButton {
        self.tintColor = .clear
        self.setBackgroundImage(UIImage(named: to), for: .normal)
        return self
    }
    
    internal func set(image to: String) -> UIButton {
        self.tintColor = .clear
        self.setImage(UIImage(named: to), for: .normal)
        return self
    }
    
    
    /**
     *** mark:- set textfield text & image space easily
     *--------------------------------------------------------
     *&&-------
     *&& set image & title space ...
     *&& in case it's en so set left title space
     *&& in case it's en so set right image space
     *&&-----
     *--------------------------------------------------------
     */
    
    internal func set(spaceBetweenTitle_Icon space: CGFloat) -> UIButton {
        // get app language
        let currentLang = MOLHLanguage.currentAppleLanguage()
        
        let leftTitleEdge = (currentLang == "en") ? space : 0.0
        let rightTitleEdge = (currentLang == "en") ? 0.0 : space
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: leftTitleEdge, bottom: 0, right: rightTitleEdge)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: rightTitleEdge, bottom: 0, right: leftTitleEdge)
        return self
    }
    
    /**
     *** mark:- set textfield text & image space easily
     *--------------------------------------------------------
     *&&-------
     *&& image view content mode
     *&&-----
     *--------------------------------------------------------
     */
    
    internal func set(contentMode: UIImageView.ContentMode) -> UIButton {
        self.imageView?.contentMode = contentMode
        return self
    }
    
}
