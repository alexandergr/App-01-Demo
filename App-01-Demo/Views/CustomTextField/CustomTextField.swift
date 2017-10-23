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

    @IBInspectable var highlightedColor: UIColor = UIColor.yellow
    @IBInspectable var normalTextColor: UIColor = UIColor.black
    @IBInspectable var normalSeparatorColor: UIColor = UIColor.darkGray

    var isHighlighted: Bool = false {
        didSet {
            if isHighlighted {
                addHighlighting()
            } else {
                removeHighlighting()
            }
        }
    }
    var highlightingView: UIView?

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
    @IBOutlet weak var separatorView: UIView!

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
        self.isHighlighted = true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textFieldDidEndEditing?(textField)
        self.isHighlighted = false
    }
}

extension CustomTextField {
    //#MARK: - field highlighting

    func addHighlighting() {
        self.label.textColor = self.highlightedColor
        self.textField.tintColor = self.highlightedColor
        self.textField.textColor = self.highlightedColor

        let highlightingView = UIView()
        self.highlightingView = highlightingView
        highlightingView.backgroundColor = self.highlightedColor
        highlightingView.frame = CGRect(origin: self.separatorView.layer.bounds.origin, size: CGSize(width: 0.0, height: self.separatorView.layer.bounds.size.height))
        highlightingView.translatesAutoresizingMaskIntoConstraints = false
        self.separatorView.addSubview(highlightingView)

        let delta = self.separatorView.layer.bounds.size.width * 0.15;
        let middlePositionFrame = CGRect(origin: self.separatorView.layer.bounds.origin, size: CGSize(width: delta, height: self.separatorView.layer.bounds.size.height))
        let leftPositionFrame = CGRect(origin: CGPoint(x: self.separatorView.layer.bounds.size.width - delta, y: 0), size: middlePositionFrame.size)

        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveLinear, animations: {
            self.highlightingView?.frame = middlePositionFrame
        }) { (completed) in
            if completed {
                self.highlightingView?.frame = middlePositionFrame
                UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveLinear, animations: {
                    self.highlightingView?.frame = leftPositionFrame
                }) { (completed) in
                    if completed {
                        self.highlightingView?.frame = leftPositionFrame
                        UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveLinear, animations: {
                            self.highlightingView?.frame = self.separatorView.layer.bounds
                        }) { (completed) in
                            if completed {
                                self.highlightingView?.frame = self.separatorView.layer.bounds
                            }
                        }
                    }
                }
            }
        }
    }

    func removeHighlighting() {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
            self.label.textColor = self.normalTextColor
            self.textField.tintColor = self.normalTextColor
            self.textField.textColor = self.normalTextColor

            if let highlightingView = self.highlightingView {
                highlightingView.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 0.0, height: highlightingView.frame.size.height))
            }

        }) { (completed) in
            if completed {
                self.label.textColor = self.normalTextColor
                self.textField.tintColor = self.normalTextColor
                self.highlightingView?.removeFromSuperview()
                self.highlightingView = nil
            }
        }
    }

}
