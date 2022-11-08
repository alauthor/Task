//
//  CheckOutVCPresenter+Action.swift
//  Task
//
//  Created by AHMED-SAMIR on 08/11/2022.
//  
//

import Foundation

protocol CheckOutViewDelegate: class
{
    /**
     -> VARIABLES
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    var presenter: CheckOutVCPresenter! { get set }
    /**
     -> FUNCTIONS
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    func reloadData()
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func updateViewData(total price: String, items count: String) 
}
