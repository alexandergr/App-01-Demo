//
//  CustomTextField.swift
//  App-01-Demo
//
//  Created by Alexander on 10/21/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UIView {

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

        textField.delegate = self
    }

    @IBInspectable var title: String = "Field" {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!

    var delegate: UITextFieldDelegate?
    var text: String? {
        set {
            textField.text = text
        }
        get {
            return textField.text
        }
    }

    func updateViews() {
        label.text = title
        textField.placeholder = title
    }
}

extension CustomTextField : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.textFieldDidBeginEditing?(textField)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textFieldDidEndEditing?(textField)
    }
}
