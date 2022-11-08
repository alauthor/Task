//
//  UIViewController+Helper.swift
//  concard
//
//  Created by admin on 9/20/20.
//  Copyright © 2020 pomac. All rights reserved.
//

import UIKit
import MOLH

extension UIViewController {
    
    internal func setupNavigationBack() -> Void {
        var image = UIImage(named: "ic_left_arrow")!
        if MOLHLanguage.currentAppleLanguage() == "ar" {
            image = image.withHorizontallyFlippedOrientation()
        }
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(popup))
    }
    
    @objc func popup() -> Void {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    internal func set(_ title: String) -> Void {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .clear
        titleLabel.font = UIFont(name: "Cairo-Regular", size: 17.0)!
        if self.parent?.navigationItem != nil {
            self.parent!.navigationItem.titleView = titleLabel
        }
        navigationItem.titleView = titleLabel
    }
    
    internal func setupNavigationItemButtons() -> Void {
        let chat = UIImage(named: "ic_chat_icon")!.withHorizontallyFlippedOrientation()
        let language = UIImage(named: "ic_change_lang_icon")!.withHorizontallyFlippedOrientation()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: chat, style: .plain, target: self, action: #selector(doSomeThing))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: language, style: .plain, target: self, action: #selector(changeLang))
    }
    
    @objc func doSomeThing()
    {
        let cartVC = CartVCRouter.createCartViewController()
        self.navigationController?.pushViewController(cartVC, animated: true)
    }
    
    @objc func changeLang()
    {
        let lang = MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en"
        MOLH.setLanguageTo(lang)
        MOLH.reset(transition: .curveLinear, duration: 0.5)
    }
    
    internal func hideNavBar() -> Void {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    internal func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backgroundColor = .defaultColor
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    
    func addGestureToPopupToView(mainView: UIView) {
        let hide = UITapGestureRecognizer(target: self, action: #selector(viewTappedToDismiss(_:)))
        mainView.addGestureRecognizer(hide)
    }
    
    @objc func viewTappedToDismiss(_ touch: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
