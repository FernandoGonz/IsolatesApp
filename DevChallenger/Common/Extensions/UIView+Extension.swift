//
//  UIView+Extension.swift
//  DevChallenger
//
//  Created by Fernando González on 22/08/23.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
    
}
