//
//  CartItemDataModel.swift
//  DevChallenger
//
//  Created by Fernando González on 22/08/23.
//

import UIKit

struct CartItemDataModel {
    
    private var itemsArray: [CartItem] = [
        CartItem(image: UIImage(named: "Narrow-Heel-Extra-EVA-Blue.png")!, name: "Rodrigo's Insoles", price: "US$224.95", color: "Blue"),
        CartItem(image: UIImage(named: "Narrow-Heel-Standard-Vinyl-Blue.png")!, name: "Tim's Insoles", price: "US$224.95", color: "Blue"),
    ]
    
    func getCount() -> Int {
        self.itemsArray.count
    }
    
    func getCartItem(at index: Int) -> CartItem {
        return self.itemsArray[index]
    }
    
    mutating func appendNewItem(with item: CartItem) {
        self.itemsArray.append(item)
    }
    
    mutating func deleteItem(at index: Int) {
        self.itemsArray.remove(at: index)
    }
    
}
