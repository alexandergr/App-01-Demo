//
//  Step5ViewController.swift
//  App-01-Demo
//
//  Created by Alexander on 10/21/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class Step5ViewController: UIViewController {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var button1: GradientButton!
    @IBOutlet weak var button2: GradientButton!
    @IBOutlet weak var button3: GradientButton!

    var needToShowAnimation = true

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true

        if needToShowAnimation {
            topImageView.alpha = 0.0
            label1.alpha = 0.0
            label2.alpha = 0.0
            label3.alpha = 0.0
            button1.alpha = 0.0
            button2.alpha = 0.0
            button3.alpha = 0.0
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if needToShowAnimation {
            needToShowAnimation = false

            self.topImageView.playJampingAnimation(duration: 0.5, delay: 0.0)

            label1.playFadeinAnimation(duration: 0.2, delay: 0.5)
            label2.playFadeinAnimation(duration: 0.2, delay: 0.7)
            label3.playFadeinAnimation(duration: 0.2, delay: 0.9)

            button1.playFlyFormBottomAnimation(duration: 0.2, delay: 1.2)
            button2.playFlyFormBottomAnimation(duration: 0.2, delay: 1.5)
            button3.playFlyFormBottomAnimation(duration: 0.2, delay: 1.8)

        }
    }
    
}
