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

            self.imageView.playJampingAnimation(duration: 0.5, delay: 0.0)

            UIView.animateKeyframes(withDuration: 0.5, delay: 0.0, options: .calculationModeLinear, animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.01, animations: {
                    self.label1.alpha = 0.3
                })

                UIView.addKeyframe(withRelativeStartTime: 0.01, relativeDuration: 0.99, animations: {
                    self.label1.alpha = 1.0
                })
            })

            self.label2.playFadeinAnimation(duration: 0.3, delay: 0.7)
            self.label3.playFadeinAnimation(duration: 0.3, delay: 1.2)

            self.button.playSlideFormBottomAnimation(duration: 0.5, delay: 1.7)
        }
    }
}
