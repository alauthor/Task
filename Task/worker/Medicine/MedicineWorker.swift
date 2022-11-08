//
//  MedicineWorker.swift
//  Task
//
//  Created by AHMED-SAMIR on 06/11/2022.
//  
//

import Foundation

class MedicineWorker {
    
    
    /**
     -> VARIABLES
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    var networkLayer = NetworkLayer()
    var medicineRouter = Request()

    /**
     -> FUNCTIONS
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    func getMedicine(request: MedicineRequestModel, completionHandler: @escaping (_: MedicineDataModel?, _: Error?) -> Void)
    {
        medicineRouter.parameters = [
            "IndexFrom": request.IndexFrom,
            "IndexTo": request.IndexTo,
            "SearchKey": request.searchKey,
        ]
        medicineRouter.endPodint = .medicationitems
        medicineRouter.method = .post
        networkLayer.request(medicineRouter, decodeToType: MedicineDataModel.self) { result in
            print(result)
            switch result {
            case .success(let model):
                completionHandler(model, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
}
