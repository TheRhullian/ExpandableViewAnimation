//
//  AnimatedView.swift
//  ExpandedViewAnimation
//
//  Created by Rhullian Damião on 28/05/2018.
//  Copyright © 2018 Rhullian Damião. All rights reserved.
//

import UIKit

@IBDesignable
class AnimatedView: UIView {

    
    /// Radius of the view
    @IBInspectable var radius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    
    override func prepareForInterfaceBuilder() {
    }
    
    override func awakeFromNib() {
    }
    

}
