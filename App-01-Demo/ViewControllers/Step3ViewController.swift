//
//  Step3ViewController.swift
//  App-01-Demo
//
//  Created by Alexander on 10/21/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

class Step3ViewController: UIViewController {

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppearAction(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppearAction(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppearAction(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        view.endEditing(true)
        moveButtonToBottom()

        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    @objc func keyboardAppearAction(notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }

        moveButton(to: keyboardFrame.height)
    }

    @objc func keyboardChangeAction(notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }

        moveButton(to: keyboardFrame.height)
    }

    @objc func keyboardDisappearAction(notification: Notification) {
        moveButtonToBottom()
    }

    func moveButtonToBottom() {
        moveButton(to: 0)
    }

    func moveButton(to height: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.bottomConstraint.constant = height
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
    }
}
