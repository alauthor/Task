//
//  Routing.swift
//  moshtary
//
//  Created by admin on 1/25/20.
//  Copyright © 2020 com.pomac.moshtary. All rights reserved.
//

import UIKit

class Routing {
    
    /**
     *** -> FUNCTION in route file should be like this
     *** -----------------------------------------------------------------------------------------------
     *** -> open(.login) -> router.open(.login)
     *** -----------------------------------------------------------------------------------------------
     */
    
    enum viewControllers {
        case CheckOut
    }
    
    enum cases {
        case pushable, presentable, popup, rootable, pop, dismissable, triggerevent(_: Notification.Name, _: Any?)
    }
    
    internal func open(_ viewController: viewControllers, _ state: cases, parent: UIViewController, with menu: viewControllers? = nil, add animation: Bool? = true)
    {
        self.setModularity(
            getController(viewController),
            state, parent: parent,
            with: menu, animation: animation
        )
    }
    
    
    private func setModularity(_ viewController: UIViewController, _ state: cases, parent: UIViewController, with menu: viewControllers? = nil, animation animatied: Bool? = true)
    {
        switch state {
        case .popup :
            viewController.modalPresentationStyle = .overCurrentContext
            parent.present(viewController, animated: animatied!)
            break
        case .pushable :
            if let navigationController = parent.navigationController {
                navigationController.pushViewController(viewController, animated: animatied!)
            } else if let navigationController = parent.children.first {
                navigationController.navigationController!.pushViewController(viewController, animated: animatied!)
            }
            break
        case .presentable :
            viewController.modalPresentationStyle = .overFullScreen
            parent.present(viewController, animated: animatied!)
            break
        case .rootable :
            if let key = UIApplication.shared.delegate?.window as? UIWindow {
                key.rootViewController?.dismiss(animated: true)
                key.rootViewController = viewController
            }
            break
        case .pop :
            parent.navigationController?.popViewController(animated: animatied!)
            break
        case .dismissable :
            if let presented = parent.presentingViewController {
                parent.dismiss(animated: animatied!) {
                    viewController.modalPresentationStyle = .overFullScreen
                    presented.present(viewController, animated: animatied!)
                }
            }
            break
        case .triggerevent(let name, let data) :
            let controller = parent
            parent.dismiss(animated: true, completion:  {
                CustomNC.post(name, object: controller, data: data)
            })
            break
        }
        
    }
    
    private func getController(_ viewController: viewControllers) -> UIViewController
    {
        var controller: UIViewController!
        switch viewController { // THE BEGINING OF SWITCH
        case .CheckOut :
            controller = CheckOutVCRouter.createCheckOutViewController()
            break
        } // end of switch case
        
        return controller
    }
    
    
    public func handleTriggerEvent(with name: Notification.Name, data: Any?, and controller: UIViewController)
    {
        controller.dismiss(animated: true) {
            CustomNC.post(name, object: controller, data: data)
        }
    }
    
    
    /**
     rootable only function
     ------------------------
     */
    
    public func open(_ viewcontroller: UIViewController)
    {
        UIApplication.shared.delegate?.window??.rootViewController?.dismiss(animated: true, completion: {
            UIApplication.shared.delegate?.window??.rootViewController = viewcontroller
        })
    }
    
}
