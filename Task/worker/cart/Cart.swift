//
//  Cart.swift
//  Task
//
//  Created by AHMED-SAMIR on 07/11/2022.
//  
//

import Foundation
import RealmSwift

class Cart: Object {
    
    @Persisted(primaryKey: true) var _id: Int = 0
    @Persisted var name: String = ""
    @Persisted var desc: String = ""
    @Persisted var price: Float = 0.0
    @Persisted var imageUrl: String = ""
    @Persisted var count: Int = 1

    convenience init(id: Int, name: String, desc: String, price: Float, imageUrl: String, count: Int) {
        self.init()
        self.name = name
        self.desc = desc
        self.price =  price
        self.count = count
        self._id = id
        self.imageUrl = imageUrl
    }
    
}

class CartViewModel {
    
    var name: String!
    var price: String!
    var desc: String!
    var imageUrl: URL!
    var count: String!
    var placeholder: String
    
    init(model: Cart) {
        self.name = model.name
        self.placeholder = self.name.first?.lowercased() ?? ""
        self.desc = model.desc
        self.price = "\(model.price) " + "currency".localized
        self.imageUrl = URL(string: model.imageUrl)
        self.count = "\(model.count)"
    }
    
    
}

class CartRequestModel {
    
    var id: Int = 0
    var name: String = ""
    var desc: String = ""
    var imageUrl: String = ""
    var price: Float = 0.0
    var increaseCount: Bool = false
}
