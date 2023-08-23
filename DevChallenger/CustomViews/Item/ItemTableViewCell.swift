//
//  ItemTableViewCell.swift
//  DevChallenger
//
//  Created by Fernando González on 22/08/23.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var detailStackView: UIStackView!
    
    private var item: CartItem?
    private var cartItemManager: CartItemManager?
    private var index: Int?
    
    var updateDetalActionHandler:((_ sender: UIButton) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setup(for item: CartItem, index: Int, manager: CartItemManager) {
        self.item = item
        self.index = index
        self.cartItemManager = manager
        
        self.itemImageView.image = item.image
        self.nameLabel.text = item.name
        self.priceLabel.text = item.price
        self.colorLabel.text = item.color
        self.detailStackView.isHidden = !item.isDetailed
        
    }
    
    @IBAction func deleteItemPressed(_ sender: UIButton) {
        
        if let safeIndex: Int = self.index, let safeManager: CartItemManager = self.cartItemManager {
            safeManager.deleteItem(at: safeIndex)
        }
        
    }
    
    
    @IBAction func addPairPressed(_ sender: UIButton) {
        
        if let safeItem: CartItem = self.item, let safeManager: CartItemManager = self.cartItemManager {
            safeManager.duplicateItem(for: safeItem)
        }
        
    }
    
    @IBAction func productDetailPressed(_ sender: UIButton) {
        
        if let safeItem: CartItem = self.item, let safeManager: CartItemManager = self.cartItemManager {
            safeItem.isDetailed = !safeItem.isDetailed
            safeManager.updateItemDetail()
        }

    }
    
}
