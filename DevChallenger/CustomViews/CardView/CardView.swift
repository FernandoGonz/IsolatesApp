//
//  CardView.swift
//  DevChallenger
//
//  Created by Fernando González on 22/08/23.
//

import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initialSetup()
    }
    
    private func initialSetup() {
        layer.cornerRadius = 10
        cornerRadius = 10
    }
    
}
