//
//  CheckOutVC+PD.swift
//  Task
//
//  Created by AHMED-SAMIR on 08/11/2022.
//  
//

import UIKit

extension CheckOutVC: CheckOutViewDelegate
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
    
    func updateViewData(total price: String, items count: String) {
        self.itemsCountLabel.text = count
        self.totalPriceLabel.text = price
    }
    
}
