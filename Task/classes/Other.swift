//
//  Other.swift
//  astra7a
//
//  Created by admin on 12/2/19.
//  Copyright © 2019 d-development.astra7a. All rights reserved.
//

import UIKit

class Other {
    
    func share(title: String) -> UIActivityViewController?
    {
        let message = title
        //Set the link to share.
        if let image = UIImage(named: "ic_logo")
        {
            let objectsToShare = [message, image] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
            return activityVC
        }
        return nil
    }
    
    func call(number: String) {
        if let url = URL(string: "tel://\(number)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    
    func openLink(link: String)
    {
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
    
    func openwhatsapp(phone: String) {
        let whatsappURL = URL(string: "https://api.whatsapp.com/send?phone=\(phone)")
        if UIApplication.shared.canOpenURL(whatsappURL!) {
            UIApplication.shared.open(whatsappURL!, options: [:])
        }
    }
    
    func openMapInBrowser(lat: String, lng: String) {
        guard let url = URL(string: "http://maps.google.com/maps?daddr=\(lat),\(lng)") else {
            return
        }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
}
