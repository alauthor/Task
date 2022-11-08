//
//  MedicineVC+PD.swift
//  Task
//
//  Created by AHMED-SAMIR on 06/11/2022.
//  
//

import UIKit

extension MedicineVC: MedicineViewDelegate
{
    /**
     -> FUNCTIONS
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    func reloadData()
    {
        self.tableView.reloadData()
    }
    
    func showLoadingIndicator()
    {
        loading.view = self.view
        loading.load()
    }
    
    func hideLoadingIndicator()
    {
        loading.done()
    }
    
    
}
