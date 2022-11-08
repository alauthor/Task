//
//  UITextView+Designable.swift
//  Test
//
//  Created by admin on 4/15/20.
//  Copyright © 2020 testing. All rights reserved.
//

import UIKit

extension UITextView {
    
    /**
     *** 1- content inset
     */
    
    
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
     *&& set [0] top
     *&& set [1] left
     *&& set [2] bottom
     *&& set [3] right
     *&&-----
     *--------------------------------------------------------
     */
    
    internal func set(contentInset: [CGFloat]) -> UITextView {
        self.textContainerInset = UIEdgeInsets(
            top: contentInset[0], left: contentInset[1],
            bottom: contentInset[2], right: contentInset[3]
        )
        return self
    }
    
    
}
