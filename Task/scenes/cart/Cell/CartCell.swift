//
//  CartCell.swift
//  Task
//
//  Created by AHMED-SAMIR on 07/11/2022.
//  
//

import UIKit
import Kingfisher

protocol CartCellViewDelegate {
    func configureCell(model: CartViewModel)
    var increaseClosure:  (() -> ())? { get set }
    var decreaseClosure:  (() -> ())? { get set }
}

class CartCell: UITableViewCell, CartCellViewDelegate {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageUrl: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var countView: UIView!
    
    var increaseClosure: (() -> ())?
    var decreaseClosure: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        minusButton.set(title: "").clear()
        plusButton.set(title: "").clear()
        countView.set(rounded: true).clear()
        self.imageUrl.set(rounded: true).clear()
    }
    
    func configureCell(model: CartViewModel) {
        self.priceLabel.text = model.price
        self.nameLabel.text = model.name
        self.countLabel.text = model.count
        self.imageUrl.loadImage(url: model.imageUrl, first: model.placeholder)
    }
    
    @IBAction func plusClicked(sender: UIButton) {
        self.increaseClosure?()
    }
    
    @IBAction func minusClicked(sender: UIButton) {
        self.decreaseClosure?()
    }
    
}
