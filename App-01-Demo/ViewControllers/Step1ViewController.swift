//
//  Step1ViewController.swift
//  App-01-Demo
//
//  Created by Alexander on 10/21/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class Step1ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var button: UIButton!

    var needToShowAnimation = true
    var animator: UIViewPropertyAnimator?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if needToShowAnimation {
            imageView.alpha = 0.0
            label1.alpha = 0.0
            label2.alpha = 0.0
            label3.alpha = 0.0
            button.alpha = 0.0
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if needToShowAnimation {
            needToShowAnimation = false

            UIView.animateKeyframes(withDuration: 0.5, delay: 0.0, options: .calculationModeLinear, animations: {
                let originalImagePosition = self.imageView.center
                let imageHeight = self.imageView.frame.size.height

                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.01, animations: {
                    self.imageView.transform = CGAffineTransform.init(scaleX: 1.0, y: 0.8)
                    self.imageView.center = CGPoint(x: originalImagePosition.x, y: originalImagePosition.y + imageHeight * 0.1)
                })

                UIView.addKeyframe(withRelativeStartTime: 0.01, relativeDuration: 0.01, animations: {
                    self.imageView.alpha = 0.5
                    self.label1.alpha = 0.5
                })

                UIView.addKeyframe(withRelativeStartTime: 0.02, relativeDuration: 0.33, animations: {
                    self.imageView.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.3)
                    self.imageView.center = CGPoint(x: originalImagePosition.x, y: originalImagePosition.y - imageHeight * 0.15)
                    self.imageView.alpha = 1.0
                    self.label1.alpha = 1.0
                })

                UIView.addKeyframe(withRelativeStartTime: 0.35, relativeDuration: 0.30, animations: {
                    self.imageView.transform = CGAffineTransform.init(scaleX: 1.0, y: 0.8)
                    self.imageView.center = CGPoint(x: originalImagePosition.x, y: originalImagePosition.y + imageHeight * 0.1)
                })

                UIView.addKeyframe(withRelativeStartTime: 0.65, relativeDuration: 0.30, animations: {
                    self.imageView.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.1)
                    self.imageView.center = CGPoint(x: originalImagePosition.x, y: originalImagePosition.y - imageHeight * 0.05)
                })

                UIView.addKeyframe(withRelativeStartTime: 0.95, relativeDuration: 0.05, animations: {
                    self.imageView.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
                    self.imageView.center = originalImagePosition
                })
            })

            UIView.animateKeyframes(withDuration: 1.0, delay: 0.5, options: .calculationModeLinear, animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2, animations: {
                    self.label2.alpha = 0.0
                })

                UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.3, animations: {
                    self.label2.alpha = 1.0
                })

                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.2, animations: {
                    self.label3.alpha = 0.0
                })

                UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3, animations: {
                    self.label3.alpha = 1.0
                })
            })

            UIView.animateKeyframes(withDuration: 0.5, delay: 1.5, options: .calculationModeLinear, animations: {
                let originalButtonPosition = self.button.center
                let buttonHeight = self.button.frame.size.height

                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.01, animations: {
                    self.button.center = CGPoint(x: originalButtonPosition.x, y: originalButtonPosition.y + buttonHeight)
                })

                UIView.addKeyframe(withRelativeStartTime: 0.48, relativeDuration: 0.01, animations: {
                    self.button.alpha = 1.0
                })

                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                    self.button.center = originalButtonPosition
                })
            })
        }
    }
}
