//
//  CartVC.swift
//  Task
//
//  Created by AHMED-SAMIR on 07/11/2022.
//  
//

import UIKit

class CartVC: UIViewController {
    
    /**
     -> IBOUTLETES
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var checkOutButtonContainerView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    /**
     -> VARIABLES
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    var presenter : CartVCPresenter!
    var loading: Loading = Loading()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        /**
         -> ( SETUP YOUR VIEW DESIGN )
         -> ( SETUPTABLEVIEW )
         -> (  TRIGER PRESENTER )
         ----------------------------------
         -> WRITE YOUR CODE HERE ->
         */
        
        checkOutButtonContainerView.set(corners: [.topLeft, .topRight], radius: 24).clear()
        searchTextField.set(iconView: "ic_search_icon", padding: 10).set(corner: 12).clear()
        setupNavigationBar()
        setupNavigationBack()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        set("cart_title".localized)
        presenter.viewDidLoad()
    }
    
    /**
     -> IBACTIONS
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    
    @IBAction func confirm(_ sender: UIButton)
    {
        self.presenter.openCheckOut()
    }
    
}
