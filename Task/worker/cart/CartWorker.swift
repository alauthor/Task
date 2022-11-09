//
//  CartWorker.swift
//  Task
//
//  Created by AHMED-SAMIR on 07/11/2022.
//  
//

import Foundation
import RealmSwift

class CartWorker {
    
    
    /**
     -> VARIABLES
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    var networkLayer = try! Realm()
    var cartRouter = Request()

    /**
     -> FUNCTIONS
     ===================================
     ->   WRITE YOUR CODE HERE ->
     */
    
    func getCart(completionHandler: @escaping (_: [Cart], _: Error?) -> Void)
    {
        var carts = [Cart]()
        let response = networkLayer.objects(Cart.self)
        response.forEach { cart in
            carts.append(cart)
        }
        completionHandler(carts, nil)
    }
    
    func setCart(request: CartRequestModel) -> String
    {
        if let _ = self.networkLayer.object(ofType: Cart.self, forPrimaryKey: request.id) {
            return "medicine_already_in_cart".localized
        }
        
//        var count = self.networkLayer.objects(Cart.self).count
//        if request.increaseCount {
//            count += 1
//        }
//
        let cart = Cart(id: request.id, name: request.name, desc: request.desc, price: request.price, imageUrl: request.imageUrl, count: 1)
        try! self.networkLayer.write {
            self.networkLayer.add(cart)
        }
        return "medicine_added_successfully".localized
    }
    
    func changeQty(cartId: Int, increase: Bool = false) //, completionHandler: @escaping (_: [Cart], _: Error?) -> Void) -> [Cart]
    {
        if let cart = self.networkLayer.object(ofType: Cart.self, forPrimaryKey: cartId) {
            let count = (increase == true) ? (cart.count + 1) : (cart.count <= 1) ? cart.count : (cart.count - 1)
            try! self.networkLayer.write {
                cart.setValue(count, forKey: "count")
            }
        }
        
    }
    
    func deleteItem(cartId: Int) {
        if let cart = self.networkLayer.object(ofType: Cart.self, forPrimaryKey: cartId) {
            try! self.networkLayer.write {
                self.networkLayer.delete(cart)
            }
        }
    }
    
    func convertMedicineToLocalCart(medicine: Medicine) -> CartRequestModel {
        let request = CartRequestModel()
        request.name = medicine.EnglishName ?? ""
        request.desc = medicine.Description ?? ""
        request.imageUrl = medicine.PicUrl ?? ""
        request.id = medicine.Id?.intVal ?? 0
        request.increaseCount = true
        request.price = medicine.Price ?? 0.0
        return request
    }
    
}
