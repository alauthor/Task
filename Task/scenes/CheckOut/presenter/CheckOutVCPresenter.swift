//
//  CheckOutVCPresenter.swift
//  Task
//
//  Created by AHMED-SAMIR on 08/11/2022.
//  
//

import Foundation

class CheckOutVCPresenter
{
    
    /**
     -> VARIABLES
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    private weak var view: CheckOutViewDelegate!
    private var router: CheckOutVCRouter!
    private var worker: CartWorker!
    private var carts = [Cart]()
    
    /**
     -> FUNCTIONS
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    init(view: CheckOutViewDelegate, router: CheckOutVCRouter, worker: CartWorker)
    {
        self.view = view
        self.router = router
        self.worker = worker
    }
    
    
    
}


extension CheckOutVCPresenter
{
    
    /**
    -> NETWORK-WORKER
    ===================================
    ->   WRITE YOUR CODE HERE ->
    */
    
    internal func viewDidLoad()
    {
        self.view.showLoadingIndicator()
        self.worker.getCart { [weak self] carts, error in
            guard let self = self else { return }
            self.view.hideLoadingIndicator()
            if let error = error?.localizedDescription {
                self.router.displayToast(message: error)
                return
            }
            self.carts = carts
            self.view.updateViewData(total: self.calPriceView(), items: self.productsCountView())
            self.view.reloadData()
        }
    }
    
    private func calPriceView() -> String {
        var total: Float = 0.0
        self.carts.forEach { cart in
            total += cart.price
        }
        return "\(total) " + "currency".localized
    }
    
    private func productsCountView() -> String {
        return ( "check_out_products_count".localized + "\(self.carts.count)" )
    }
    
    /**
    -> TABLEVIEW / COLLECTIONVIEW
    ===================================
    ->   WRITE YOUR CODE HERE ->
    */
    
    
    var rowCount: Int {
        return self.carts.count
    }
    
    func displayCell(cell: CheckOutCellViewDelegate, at index: Int)
    {
        var cell = cell
        let cart = self.carts[index]
        let model = CartViewModel(model: cart)
        cell.deleteClosure = { [weak self] in
            guard let self = self else { return }
            self.deleteItem(cart: cart)
        }
        cell.configureCell(model: model)
    }
    
    private func deleteItem(cart: Cart) {
        self.router.aus { [weak self] in
            guard let self = self else { return }
            self.worker.deleteItem(cartId: cart._id)
            self.viewDidLoad()
        }
    }
    
    func didSelectRow(at index: Int)
    {
        
    }
    
    
}
