//
//  CheckOutCell.swift
//  Task
//
//  Created by AHMED-SAMIR on 08/11/2022.
//  
//

import UIKit

protocol CheckOutCellViewDelegate {
    func configureCell(model: CartViewModel)
    var deleteClosure: (() -> ())? { get set }
}

class CheckOutCell: UITableViewCell, CheckOutCellViewDelegate {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageUrl: UIImageView!
    @IBOutlet weak var deleteButton: UIButton!
    
    
    var deleteClosure: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        deleteButton.set(title: "").clear()
        self.imageUrl.set(rounded: true).clear()
    }
    
    func configureCell(model: CartViewModel) {
        self.nameLabel.text = model.name
        self.priceLabel.text = model.price
        self.imageUrl.loadImage(url: model.imageUrl, first: model.placeholder)
    }
    
    @IBAction func deleteClicked(_ sender: UIButton) {
        self.deleteClosure?()
    }
    
}
