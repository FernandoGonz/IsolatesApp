//
//  AddIsolateTableViewCell.swift
//  DevChallenger
//
//  Created by Fernando González on 22/08/23.
//

import UIKit

class AddIsolateTableViewCell: UITableViewCell {
    
    private var cartItemManager: CartItemManager?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup(manager: CartItemManager) {
        
        self.cartItemManager = manager
        
    }
    
    @IBAction func addIsolatePressed(_ sender: UIButton) {
        if let safeManager: CartItemManager = self.cartItemManager {
            safeManager.addAnItem()
        }
    }
    
}
