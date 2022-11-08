//
//  NotificationCenter.swift
//  Tagwed
//
//  Created by admin on 10/22/19.
//  Copyright © 2019 Tagwed. All rights reserved.
//

import UIKit

class CustomNC { // CustomNotificationCenter
    
    class func createNotificationCenter(_ forName: Notification.Name, comp: @escaping (_: Notification) -> ()) -> NSObjectProtocol {
        let observer = NotificationCenter.default.addObserver(forName: forName, object: nil, queue: OperationQueue.main) { (notification) in
            comp(notification)
        }
        return observer
    }
    
    class func post(_ forName: Notification.Name, object: UIViewController, data: Any? = nil) {
        if let data = data {
            NotificationCenter.default.post(name: forName, object: object, userInfo: ["data": data])
        } else {
            NotificationCenter.default.post(name: forName, object: object)
        }
    }
    
    class func removeObserver(observer: NSObjectProtocol?) {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
}

extension Notification.Name
{
    static var selectProvider = Notification.Name("selectProvider")
    static var myorders = Notification.Name("myorders")
}
