//
//  CartItemDataModel.swift
//  DevChallenger
//
//  Created by Fernando González on 22/08/23.
//

import UIKit

struct CartItemDataModel {
    
    private let isolatesBank: [CartItem] = [
        CartItem(image: UIImage(named: "Narrow-Heel-Extra-EVA-Blue.png")!, name: "Rodrigo's Insoles", price: 224.54, size: "F 3", weight: "44 lbs", purpose: "Casual", type: "Athletic", padding: "Padding", top: "EVA", color: "Blue", width: "Regular", flex: "Extra", stability: "Heel"),
        CartItem(image: UIImage(named: "Narrow-Heel-Extra-Vinyl-Tan.png")!, name: "Tims's Insoles", price: 318.11, size: "F 3", weight: "34 lbs", purpose: "Casual", type: "Athletic", padding: "Padding", top: "Vinyl", color: "Tan", width: "Regular", flex: "Extra", stability: "Heel"),
        CartItem(image: UIImage(named: "Narrow-Heel-Standard-MicroSilver.png")!, name: "Fernando's Insoles", price: 194.65, size: "F 3", weight: "50 lbs", purpose: "Casual", type: "Athletic", padding: "Padding", top: "EVA", color: "Silver", width: "Regular", flex: "Standard", stability: "Heel"),
        CartItem(image: UIImage(named: "Narrow-Heel-Standard-Vinyl-Blue.png")!, name: "Andy's Insoles", price: 289.92, size: "F 3", weight: "60 lbs", purpose: "Casual", type: "Athletic", padding: "Padding", top: "Vinyl", color: "Blue", width: "Regular", flex: "Standard", stability: "Heel"),
        CartItem(image: UIImage(named: "Narrow-No-Heel-Extra-EVA-Red.png")!, name: "Rick's Insoles", price: 189.89, size: "F 3", weight: "74 lbs", purpose: "Casual", type: "Athletic", padding: "Padding", top: "EVA", color: "Red", width: "Regular", flex: "Standard", stability: "No Heel"),
    ]
    
    private var itemsArray: [CartItem] = []
    
    private var index: Int = 0
    
    func getCount() -> Int {
        self.itemsArray.count
    }
    
    func getCartItem(at index: Int) -> CartItem {
        return self.itemsArray[index]
    }
    
    func getTotalPriceAsString() -> String {
        var total: Double = 0
        self.itemsArray.forEach { item in
            total += item.price
        }
        return String(format: "US$%.2f", total)
    }
    
    mutating func appendNewItem(with item: CartItem) {
        self.itemsArray.append(item)
    }
    
    mutating func deleteItem(at index: Int) {
        self.itemsArray.remove(at: index)
    }
    
    mutating func addNextItem() {
        if index < self.isolatesBank.count {
            self.itemsArray.append(self.isolatesBank[self.index])
            self.index += 1
        }
        if index == self.isolatesBank.count {
            self.index = 0
        }
    }
}
