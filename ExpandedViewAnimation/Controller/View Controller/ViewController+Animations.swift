//
//  ViewController+Animations.swift
//  ExpandedViewAnimation
//
//  Created by Rhullian Damião on 28/05/2018.
//  Copyright © 2018 Rhullian Damião. All rights reserved.
//

import UIKit

extension ViewController {
    
    /// Function that hides de description label
    func animateHideDescriptionLabel() {
        self.descriptionLabel.isHidden = true
        self.descriptionLabel.alpha = 0
    }
    /// Function that hides de description label
    func animateShowDescriptionLabel() {
        self.descriptionLabel.isHidden = false
        self.descriptionLabel.alpha = 1
    }
    
    //Function that expands the View
    func animateExpandAnimatedView() {
        //Get the width and height of the screen
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        //Setup the constraints for full screen
        //Store the initial value of constraints
        self.storeInitialValues()
        ////Change the value of animated view constraints
        self.viewTopConstraint.constant = 0
        self.viewWidthConstraint.constant = screenWidth
        self.viewHeigthConstraint.constant = screenHeight
        self.animatedView.layer.cornerRadius = 0
        
        self.view.layoutIfNeeded()
    }
    //Function that expands the View
    func animateResetAnimatedView() {
        //Get initial values of constraints
        guard let top = self.initialTopConstant,
            let width = self.initialWidthConstant,
            let height = self.initialHeightConstant,
            let radius = self.initialRadiusValue else {
                print("->ERROR: could not get the initial values of constraints and radius")
                return
        }
        ////Change the value of animated view constraints
        self.viewTopConstraint.constant = top
        self.viewWidthConstraint.constant = width
        self.viewHeigthConstraint.constant = height
        self.animatedView.layer.cornerRadius = radius
        
        self.view.layoutIfNeeded()
    }
    
    //Function reponsible for storing the initial values
    private func storeInitialValues() {
        self.initialTopConstant = self.viewTopConstraint.constant
        self.initialWidthConstant = self.viewWidthConstraint.constant
        self.initialHeightConstant = self.viewHeigthConstraint.constant
        self.initialRadiusValue = self.animatedView.layer.cornerRadius
    }
}
