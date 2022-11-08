//
//  Toast.swift
//  moshtary
//
//  Created by admin on 1/17/20.
//  Copyright © 2020 com.pomac.moshtary. All rights reserved.
//

import UIKit
import Toast_Swift

enum ToastStaus {
    case success
    case failure
    case warning
}

protocol ToastProtocol {
    func displayToast(message: String?, _ state : ToastStaus)
}

class Toast {
    
    var view: UIView!
    var timeInterval: TimeInterval = 5.0
    
    func showToast(message: String?)
    {
        let style = ToastStyle()
        
        self.view.makeToast(message, duration: self.timeInterval, position: .bottom, style: style)
    }
    
}
