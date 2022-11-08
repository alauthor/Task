//
//  InitalRouting.swift
//  Tmam
//
//  Created by admin on 2/21/20.
//  Copyright © 2020 com.pomac.tmam. All rights reserved.
//

import UIKit


class InitalRouting {
    
    public static func initController() -> UIViewController
    {
        let viewController: UIViewController = MedicineVCRouter.createMedicineViewController()
        return viewController
    }
    
}
