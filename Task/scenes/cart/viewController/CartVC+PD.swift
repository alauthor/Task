//
//  CartVC+PD.swift
//  Task
//
//  Created by AHMED-SAMIR on 07/11/2022.
//  
//

import UIKit

extension CartVC: CartViewDelegate
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
    
    func displayCartPrice(price: String) {
        self.priceLabel.text = price
    }
}
