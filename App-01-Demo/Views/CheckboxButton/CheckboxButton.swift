//
//  CheckboxButton.swift
//  App-01-Demo
//
//  Created by Alexander on 10/21/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

@IBDesignable
class CheckboxButton: UIButton {

    @IBInspectable var labelText: String = "Label" {
        didSet {
            updateViews()
        }
    }

    @IBInspectable var labelColor: UIColor = UIColor.black {
        didSet {
            updateViews()
        }
    }

    var checked: Bool = false {
        didSet {
            updateViews()
        }
    }

    @IBInspectable var normalBackgroundColor: UIColor = UIColor.clear {
        didSet {
            updateViews()
        }
    }

    @IBInspectable var checkedBackgroundColor: UIColor = UIColor.clear {
        didSet {
            updateViews()
        }
    }

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

        let tapGestureRecogniger = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        addGestureRecognizer(tapGestureRecogniger)

        updateViews()
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var checkboxImage: UIImageView!

    func updateViews() {
        label.text = labelText
        label.textColor = labelColor

        if checked {
            checkboxImage.image = UIImage(named: "Check")
            backgroundColor = checkedBackgroundColor
        } else {
            checkboxImage.image = UIImage(named: "Check-Uncheck")
            backgroundColor = normalBackgroundColor
        }

    }

    @objc func tapAction() {
        checked = !checked
    }

}
