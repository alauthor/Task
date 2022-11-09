//
//  CartVCPresenter.swift
//  Task
//
//  Created by AHMED-SAMIR on 07/11/2022.
//  
//

import Foundation

class CartVCPresenter
{
    
    /**
     -> VARIABLES
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    private weak var view: CartViewDelegate!
    private var router: CartVCRouter!
    private var worker: CartWorker!
    private var carts = [Cart]()
    private var cartsCopy = [Cart]()
    
    /**
     -> FUNCTIONS
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    /*lazy private var request : __Model__RequestModel = {
         let request = __Model__RequestModel()
         return request
    }()*/
    
    init(view: CartViewDelegate, router: CartVCRouter, worker: CartWorker)
    {
        self.view = view
        self.router = router
        self.worker = worker
    }
    
    
    
}


extension CartVCPresenter
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
            self.cartsCopy = carts
            self.view.reloadData()
            self.view.displayCartPrice(price: self.calPrice())
        }
    }
    
    private func calPrice() -> String {
        var total: Float = 0.0
        self.carts.forEach { cart in
            total += (Float(cart.count) * cart.price)
        }
        return "\(total) " + "currency".localized
    }
    
    func openCheckOut() {
        self.router.open(.CheckOut, .pushable)
    }
    
    internal func search(text: String) {
        if text == "" {
            self.carts = cartsCopy
            self.view.reloadData()
            return
        }
        self.carts = []
        cartsCopy.forEach { [weak self] cart in
            guard let self = self else { return }
            let model = CartViewModel(model: cart)
            if model.name.lowercased().contains(text) {
                self.carts.append(cart)
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
        return self.carts.count
    }
    
    func displayCell(cell: CartCellViewDelegate, at index: Int)
    {
        var cell = cell
        let cart = self.carts[index]
        let model = CartViewModel(model: cart)
        cell.increaseClosure = { [weak self] in
            guard let self = self else { return }
            self.changeItemQty(item: cart, increase: true)
        }
        cell.decreaseClosure = { [weak self] in
            guard let self = self else { return }
            self.changeItemQty(item: cart)
        }
        cell.configureCell(model: model)
    }
    
    private func changeItemQty(item: Cart, increase: Bool = false) {
        self.worker.changeQty(cartId: item._id, increase: increase)
        self.viewDidLoad()
    }
    
    func didSelectRow(at index: Int)
    {
        
    }
    
    
}
