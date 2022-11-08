//
//  main.swift
//  aalmak-v2
//
//  Created by admin on 9/19/20.
//  Copyright © 2020 pomac. All rights reserved.
//

import UIKit
import MOLH

class MyApplication: UIApplication {
    override init() {
        let notFirstOpenKey = "notFirstOpen"
        let notFirstOpen = UserDefaults.standard.bool(forKey: notFirstOpenKey)
        if notFirstOpen == false {
            MOLH.shared.activate(true)
            UserDefaults.standard.set(["ar", "en"], forKey: "AppleLanguages")
            UserDefaults.standard.set(true, forKey: notFirstOpenKey)
        }
        super.init()
    }
}

UIApplicationMain(
    CommandLine.argc,
    UnsafeMutablePointer(CommandLine.unsafeArgv),
    NSStringFromClass(MyApplication.self),
    NSStringFromClass(AppDelegate.self)
)


