//
//  Medicine.swift
//  Task
//
//  Created by AHMED-SAMIR on 06/11/2022.
//  
//

import Foundation
import MOLH

struct MedicineDataModel: Codable {
    var complaints: [Medicine]?
//    var SelectedMedicines: [Medicine]
    var Success: Bool?
    var Code: Int?
    var EnglishMessage: String?
    var ArabicMessage: String?
    var CurrentPage: Int?
    var IsArabic: String?
    var PageCount: Int?
    var VisitStatus: String?
}

struct Medicine: Codable {
    var Id: String?
    var code: String?
    var ArabicName: String?
    var EnglishName: String?
    var pages_count: Int?
    var rnum: Int?
    var Quantity: Int?
    var indexCount: Int?
    var SpecialtyId: Int?
    var SpecialtyId2: Int?
    var SpecialtyId3: Int?
    var IsAlreadyChecked: Int?
    var IsEnabled: Int?
    var IsLimited: Int?
    var GroupCode: String?
    var Description: String?
    var PicUrl: String?
    var Price: Float?
    var OldPrice: Float?
    var IsDrug: Bool?
    var CovidGroupName: String?
    var CovidGroupNameEN: String?
}

class MedicineViewModel {
    
    var name : String!
    var desc : String!
    var price : String!
    var imageUrl : URL!
    var placeholder: String!
    
    init(model: Medicine) {
        self.name = (MOLHLanguage.currentAppleLanguage() == "ar") ? model.ArabicName : model.EnglishName
        self.desc = model.Description
        self.price = "\(model.Price ?? 0.0) " + "currency".localized
        self.imageUrl = URL(string: (model.PicUrl ?? ""))
        self.placeholder = self.name.first?.uppercased() ?? ""
    }
    
}

class MedicineRequestModel {
    
    var IndexFrom = 1
    var IndexTo = 10
    var searchKey = ""
    
}
