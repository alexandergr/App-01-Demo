//
//  AddressForm.swift
//  App-01-Demo
//
//  Created by Alexander on 10/21/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class AddressForm: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {
        let className = String(describing: type(of: self))
        guard let view = Bundle(for: type(of: self)).loadNibNamed(className, owner: self, options: nil)?.first as? UIView else {
            return
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: .alignAllCenterY, metrics: nil, views: ["view": view]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: .alignAllCenterX, metrics: nil, views: ["view": view]))
    }

    @IBOutlet weak var textFieldView1: CustomTextField!
    @IBOutlet weak var textFieldView2: CustomTextField!
    @IBOutlet weak var textFieldView3: CustomTextField!
    @IBOutlet weak var textFieldView4: CustomTextField!
}
