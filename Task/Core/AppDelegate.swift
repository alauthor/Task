//
//  AppDelegate.swift
//  Task
//
//  Created by AHMED-SAMIR on 06/11/2022.
//


import UIKit
import MOLH
import IQKeyboardManagerSwift

//@main
class AppDelegate: UIResponder, UIApplicationDelegate, MOLHResetable {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupLang()
        setupkeyboard()
        initViewController()
        
        return true
    }
    
    private func initViewController() -> Void {
        self.window = UIWindow()
        self.window?.rootViewController = InitalRouting.initController()
        self.window?.makeKeyAndVisible()
    }
    
    private func setupkeyboard() -> Void {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 15
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.shouldToolbarUsesTextFieldTintColor = true
    }
    
    private func setupLang() -> Void {
        MOLHLanguage.setDefaultLanguage("en")
    }
    
    func reset() {
        if let delegate = UIApplication.shared.delegate!.window! {
            delegate.rootViewController!.dismiss(animated: false)
            self.initViewController()
        }
    }

}

