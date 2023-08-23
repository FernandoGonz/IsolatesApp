//
//  CartItem.swift
//  DevChallenger
//
//  Created by Fernando González on 22/08/23.
//

import UIKit

class CartItem {
    
    let image: UIImage
    let name, size, weight, purpose, type, padding, top, color, width, flex, stability: String
    let price: Double
    var isDetailed: Bool
    
    init(image: UIImage, name: String, price: Double, size: String = "F 3", weight: String = "44 lbs", purpose: String = "Casual", type: String = "Athletic", padding: String = "No Padding", top: String = "EVA", color: String, width: String = "Regular", flex: String = "Standard", stability: String = "Heel", isDetailed: Bool = false) {
        self.image = image
        self.name = name
        self.price = price
        self.size = size
        self.weight = weight
        self.purpose = purpose
        self.type = type
        self.padding = padding
        self.top = top
        self.color = color
        self.width = width
        self.flex = flex
        self.stability = stability
        self.isDetailed = isDetailed
    }
    
}
