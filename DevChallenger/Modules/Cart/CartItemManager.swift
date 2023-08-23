//
//  CartItemManager.swift
//  DevChallenger
//
//  Created by Fernando González on 22/08/23.
//

import Foundation

protocol CartItemManagerDelegate {
    func didUpdateItemDetail(_ cartItemManager: CartItemManager)
    func didDuplicateItem(_ cartItemManager: CartItemManager, cartItem: CartItem)
    func didDeleteItem(_ cartItemManager: CartItemManager, at: Int)
    func didAddItem(_ cartItemManager: CartItemManager)
}

struct CartItemManager {
    
    var delegate: CartItemManagerDelegate?
    
    func updateItemDetail() {
        self.delegate?.didUpdateItemDetail(self)
    }
    
    func duplicateItem(for item: CartItem) {
        self.delegate?.didDuplicateItem(self, cartItem: item)
    }
    
    func deleteItem(at index: Int) {
        self.delegate?.didDeleteItem(self, at: index)
    }
    
    func addAnItem() {
        self.delegate?.didAddItem(self)
    }
    
}
