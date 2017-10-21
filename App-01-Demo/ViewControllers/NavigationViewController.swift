//
//  NavigationViewController.swift
//  App-01-Demo
//
//  Created by Alexander on 10/21/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent;
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.isTranslucent = true
        navigationBar.shadowImage = UIImage()

        self.view.backgroundColor = UIColor.clear
    }

}
