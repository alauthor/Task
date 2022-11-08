//
//  MedicineVCPresenter+Action.swift
//  Task
//
//  Created by AHMED-SAMIR on 06/11/2022.
//  
//

import Foundation

protocol MedicineViewDelegate: AnyObject
{
    /**
     -> VARIABLES
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    var presenter: MedicineVCPresenter! { get set }
    /**
     -> FUNCTIONS
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    func reloadData()
    func showLoadingIndicator()
    func hideLoadingIndicator()
}
