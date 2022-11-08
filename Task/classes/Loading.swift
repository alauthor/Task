//
//  Loading.swift
//  moshtary
//
//  Created by admin on 1/17/20.
//  Copyright © 2020 com.pomac.moshtary. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialActivityIndicator

class Loading {
    
    let activityIndicator = MDCActivityIndicator()
    var view: UIView!
    
    func load(mode: MDCActivityIndicatorMode = .indeterminate, progress: Float = 1.0)
    {
        let x = ( UIScreen.main.bounds.size.width / 2 )
        let y = ( UIScreen.main.bounds.size.height / 2 )
        activityIndicator.frame.origin.x = x
        activityIndicator.frame.origin.y = y
        activityIndicator.indicatorMode = mode
        activityIndicator.radius = 40
        activityIndicator.progress = progress
        activityIndicator.strokeWidth = 4
        activityIndicator.cycleColors = [.red, .orange, .blue]
        self.view.addSubview(activityIndicator)
        self.view.isUserInteractionEnabled = false
        activityIndicator.startAnimating()
    }
    
    func done()
    {
        self.view.isUserInteractionEnabled = true
        activityIndicator.stopAnimating()
    }
    
    
}
