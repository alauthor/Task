//
//  MedicineVCPresenter.swift
//  Task
//
//  Created by AHMED-SAMIR on 06/11/2022.
//  
//

import Foundation

class MedicineVCPresenter
{
    
    /**
     -> VARIABLES
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    private weak var view: MedicineViewDelegate!
    private var router: MedicineVCRouter!
    private var worker: MedicineWorker!
    private var medicines = [Medicine]()
    private var cartWorker = CartWorker()
    private var increaseBy = 10
    private var totalPages = 0
    private var currentPage = 0
    private var medicinesCopy = [Medicine]()
    /**
     -> FUNCTIONS
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    lazy private var request : MedicineRequestModel = {
        let request = MedicineRequestModel()
        request.searchKey = ""
        request.IndexTo = (self.currentPage * self.increaseBy) + self.increaseBy
        request.IndexFrom = (self.currentPage * self.increaseBy ) + 1
        return request
    }()
    
    init(view: MedicineViewDelegate, router: MedicineVCRouter, worker: MedicineWorker, cartWorker: CartWorker)
    {
        self.view = view
        self.router = router
        self.worker = worker
        self.cartWorker = cartWorker
    }
    
}


extension MedicineVCPresenter
{
    
    /**
    -> NETWORK-WORKER
    ===================================
    ->   WRITE YOUR CODE HERE ->
    */
    
    internal func viewDidLoad()
    {
        self.view.showLoadingIndicator()
        self.worker.getMedicine(request: self.request) { [weak self] response, error  in
            guard let self = self else { return }
            self.view.hideLoadingIndicator()
            if let error = error?.localizedDescription {
                self.router.displayToast(message: error)
                return
            }
            self.currentPage = response?.CurrentPage ?? 0
            self.totalPages = response?.PageCount ?? 0
            self.medicines += response?.complaints ?? []
            self.medicinesCopy = self.medicines
            self.view.reloadData()
        }
    }
    
    internal func refresh() -> Void {
        if self.totalPages > self.currentPage {
            self.currentPage += 1
            self.viewDidLoad()
        }
        return
    }
    
    internal func search(text: String) {
        if text == "" {
            self.medicines = medicinesCopy
            self.view.reloadData()
            return
        }
        self.medicines = []
        medicinesCopy.forEach { [weak self] med in
            guard let self = self else { return }
            let model = MedicineViewModel(model: med)
            if model.name.lowercased().contains(text) {
                self.medicines.append(med)
            }
        }
        self.view.reloadData()
    }
    
    /**
    -> TABLEVIEW / COLLECTIONVIEW
    ===================================
    ->   WRITE YOUR CODE HERE ->
    */
    
    
    var rowCount: Int {
        return self.medicines.count
    }
    
    func displayCell(cell: MedicineCellViewDelegate, at index: Int)
    {
        var cell = cell
        let medicine = self.medicines[index]
        let model = MedicineViewModel(model: medicine)
        cell.addToCartClosure = { [weak self] in
            guard let self = self else { return }
            self.addToCart(medicine: medicine)
        }
        cell.configureCell(model: model)
    }
    
    private func addToCart(medicine: Medicine) {
        let request = self.cartWorker.convertMedicineToLocalCart(medicine: medicine)
        let result = self.cartWorker.setCart(request: request)
        self.router.displayToast(message: result)
    }
    
    func didSelectRow(at index: Int)
    {
        
    }
    
    
}
