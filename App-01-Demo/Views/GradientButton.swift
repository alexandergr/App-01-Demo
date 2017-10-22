//
//  GradientButton.swift
//  App-01-Demo
//
//  Created by Alexander on 10/21/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class GradientButton: UIButton {

    var gradientLayer : CAGradientLayer?

    override func layoutSubviews() {
        super.layoutSubviews()

        guard let label = self.titleLabel else {
            return
        }

        if let oldGradientLayer = self.gradientLayer {
            oldGradientLayer.removeFromSuperlayer()
        }

        let maskLayer = CATextLayer()
        maskLayer.frame = label.layer.bounds
        maskLayer.font = label.font
        maskLayer.string = label.text
        maskLayer.fontSize = label.font.pointSize
        maskLayer.foregroundColor = UIColor.black.cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0x35/255.0, green: 0xab/255.0, blue: 0xc8/255.0, alpha: 1.0).cgColor,
            UIColor(red: 0x24/255.0, green: 0x5b/255.0, blue: 0xba/255.0, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = label.layer.bounds
        gradientLayer.mask = maskLayer

        label.layer.insertSublayer(gradientLayer, above: nil)

        self.gradientLayer = gradientLayer
    }
}
