//
//  MedicineCell.swift
//  Task
//
//  Created by AHMED-SAMIR on 06/11/2022.
//  
//

import UIKit
import Kingfisher

protocol MedicineCellViewDelegate {
    func configureCell(model: MedicineViewModel)
    var addToCartClosure: (() -> ())? { get set }
}

class MedicineCell: UITableViewCell, MedicineCellViewDelegate {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var medicineImage: UIImageView!
    @IBOutlet weak var lineView: UIView!
    
    var addToCartClosure: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addToCartButton
            .set(spaceBetweenTitle_Icon: 8)
            .set(corner: 5)
            .set(border: 1)
            .set(border: .defaultColor)
            .clear()
        medicineImage.set(rounded: true).clear()
    }
    
    func configureCell(model: MedicineViewModel) {
        self.nameLabel.text = model.name
        self.priceLabel.text = model.price
        self.medicineImage.loadImage(url: model.imageUrl, first: model.placeholder)
    }
    
    @IBAction func addToCart(sender: UIButton) {
        addToCartClosure?()
    }
    
}
