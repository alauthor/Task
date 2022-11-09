//
//  MedicineVC.swift
//  Task
//
//  Created by AHMED-SAMIR on 06/11/2022.
//  
//

import UIKit

class MedicineVC: UIViewController {
    
    /**
     -> IBOUTLETES
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    /**
     -> VARIABLES
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    var presenter : MedicineVCPresenter!
    var loading: Loading = Loading()
    var refresher: UIRefreshControl!
    
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
        
        searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        searchTextField.set(iconView: "ic_search_icon", padding: 10).set(corner: 10).clear()
        setupNavigationBar()
        setupNavigationItemButtons()
        setupTableView()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.presenter.search(text: (textField.text ?? "") )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        set("medicine_title".localized)
        presenter.viewDidLoad()
    }
    
    
}
