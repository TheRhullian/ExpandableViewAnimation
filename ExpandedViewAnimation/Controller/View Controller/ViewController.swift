//
//  ViewController.swift
//  ExpandedViewAnimation
//
//  Created by Rhullian Damião on 28/05/2018.
//  Copyright © 2018 Rhullian Damião. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    //Gestures
    final var startExpandViewAnimation: UITapGestureRecognizer!
    final var startResetViewAnimation: UITapGestureRecognizer!
    //Label
    @IBOutlet weak var descriptionLabel: UILabel!
    //View
    @IBOutlet weak var animatedView: AnimatedView!
    //Constraints
    @IBOutlet weak var viewHeigthConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewTopConstraint: NSLayoutConstraint!
    //Standard Values
    var initialTopConstant: CGFloat?
    var initialWidthConstant: CGFloat?
    var initialHeightConstant: CGFloat?
    var initialRadiusValue: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupLayout()
    }
    
    /// Function responsible for the initial setup
    private func setupLayout() {
        self.startExpandViewAnimation = UITapGestureRecognizer(target: self, action: #selector(startExpandAnimatedViewAnimation))
        self.startResetViewAnimation =  UITapGestureRecognizer(target: self, action: #selector(startResetAnimatedViewAnimation))
        //Create a gesture of tap for when the user taps in the view, animation start
        self.animatedView.addGestureRecognizer(self.startExpandViewAnimation)
    }
    
    /// Function responsible for start the Animated View Animation
    @objc
    private func startExpandAnimatedViewAnimation() {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2, animations: {
                self.animateHideDescriptionLabel()
            })
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2, animations: {
                self.animateExpandAnimatedView()
            })
        }) { (done) in
            if done {
                print("->SUCCESS: animation went good")
                self.animatedView.removeGestureRecognizer(self.startExpandViewAnimation)
                self.animatedView.addGestureRecognizer(self.startResetViewAnimation)
            }
            else {
                print("->FAILED: animation went bad")
            }
        }
    }
    
    /// Function responsible for make the view back to initialState
    @objc
    private func startResetAnimatedViewAnimation() {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2, animations: {
                self.animateResetAnimatedView()
            })
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2, animations: {
                self.animateShowDescriptionLabel()
            })
        }) { (done) in
            if done {
                print("->SUCCESS: animation went good")
                self.animatedView.removeGestureRecognizer(self.startResetViewAnimation)
                self.animatedView.addGestureRecognizer(self.startExpandViewAnimation)
            }
            else {
                print("->FAILED: animation went bad")
            }
        }
    }
}

