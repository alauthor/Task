//
//  CartVCPresenter+Action.swift
//  Task
//
//  Created by AHMED-SAMIR on 07/11/2022.
//  
//

import Foundation

protocol CartViewDelegate: AnyObject
{
    /**
     -> VARIABLES
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    var presenter: CartVCPresenter! { get set }
    /**
     -> FUNCTIONS
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    func reloadData()
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func displayCartPrice(price: String)
}
