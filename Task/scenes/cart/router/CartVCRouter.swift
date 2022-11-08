//
//  CartVCRouter.swift
//  Task
//
//  Created by AHMED-SAMIR on 07/11/2022.
//  
//

import UIKit
import Alertift

class CartVCRouter: Routing
{
    /**
     -> FUNCTIONS
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    private var view: UIViewController!
    
    static func createCartViewController() -> UIViewController
    {
        let viewController = Constants.Storyboards.main.instantiateViewController(withIdentifier: "CartVC")
        if let view = viewController as? CartViewDelegate
        {
            let router = CartVCRouter()
            router.view = viewController
            let worker = CartWorker()
            let presenter = CartVCPresenter(view: view, router: router, worker: worker)
            view.presenter = presenter
        }
        return viewController
    }
    
    func open(
        _ controller: viewControllers,
        _ state: cases,
        set menu: viewControllers? = nil,
        add animation: Bool? = true ) {
        super.open(
            controller, state,
            parent: self.view,
            with: menu,
            add: animation!
        )
    }
    
    func aus(completionHandler: @escaping () -> ())
    {
        Alertift.alert(
            title: nil, message: "are_u_sure".localized
        ).action(.default("Ok".localized)){
            completionHandler()
        }.action(.cancel("Cancel".localized))
            .show(on: self.view)
    }
    
    func handleTriggerEvent(_ name : Notification.Name, data: Any? = nil) {
        self.handleTriggerEvent(
            with: name,
            data: data,
            and: self.view
        )
    }
    
    func displayToast(message: String? = nil)
    {
        let toast = Toast()
        toast.view = self.view.view
        toast.showToast(message: message)
    }
}
