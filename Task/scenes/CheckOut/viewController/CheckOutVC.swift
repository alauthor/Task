//
//  CheckOutVC.swift
//  Task
//
//  Created by AHMED-SAMIR on 08/11/2022.
//  
//

import UIKit

class CheckOutVC: UIViewController {
    
    /**
     -> IBOUTLETES
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var itemsCountLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var executeButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    
    /**
     -> VARIABLES
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    var presenter : CheckOutVCPresenter!
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
        
        executeButton.set(corner: 12).clear()
        searchTextField.set(iconView: "ic_search_icon", padding: 10).set(corner: 12).clear()
        setupTableView()
        setupNavigationBack()
        setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        set("check_out_title".localized)
        presenter.viewDidLoad()
    }
    
    /**
     -> IBACTIONS
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    
    @IBAction func execute(_ sender: UIButton)
    {
        
    }
    
}
