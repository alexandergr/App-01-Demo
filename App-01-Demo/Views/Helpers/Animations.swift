//
//  Animations.swift
//  App-01-Demo
//
//  Created by Alexander on 10/23/17.
//  Copyright © 2017 Alexander. All rights reserved.
//

import UIKit

extension UIView {
    func playJampingAnimation(duration: TimeInterval, delay: TimeInterval) {

        UIView.animateKeyframes(withDuration: duration, delay: delay, options: .calculationModeLinear, animations: {
            let originalImagePosition = self.center
            let imageHeight = self.frame.size.height

            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.01, animations: {
                self.transform = CGAffineTransform.init(scaleX: 1.0, y: 0.8)
                self.center = CGPoint(x: originalImagePosition.x, y: originalImagePosition.y + imageHeight * 0.1)
            })

            UIView.addKeyframe(withRelativeStartTime: 0.01, relativeDuration: 0.01, animations: {
                self.alpha = 0.3
            })

            UIView.addKeyframe(withRelativeStartTime: 0.02, relativeDuration: 0.33, animations: {
                self.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.3)
                self.center = CGPoint(x: originalImagePosition.x, y: originalImagePosition.y - imageHeight * 0.15)
                self.alpha = 1.0
            })

            UIView.addKeyframe(withRelativeStartTime: 0.35, relativeDuration: 0.30, animations: {
                self.transform = CGAffineTransform.init(scaleX: 1.0, y: 0.8)
                self.center = CGPoint(x: originalImagePosition.x, y: originalImagePosition.y + imageHeight * 0.1)
            })

            UIView.addKeyframe(withRelativeStartTime: 0.65, relativeDuration: 0.30, animations: {
                self.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.1)
                self.center = CGPoint(x: originalImagePosition.x, y: originalImagePosition.y - imageHeight * 0.05)
            })

            UIView.addKeyframe(withRelativeStartTime: 0.95, relativeDuration: 0.05, animations: {
                self.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
                self.center = originalImagePosition
            })
        })
    }

    func playFadeinAnimation(duration: TimeInterval, delay: TimeInterval) {
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
            self.alpha = 1.0
        })
    }

    func playSlideFormBottomAnimation(duration: TimeInterval, delay: TimeInterval) {
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: .calculationModeLinear, animations: {
            let originalButtonPosition = self.center
            let bottomPosition = CGPoint(x: self.center.x, y: UIScreen.main.bounds.size.height + self.frame.size.height/2.0 + 1)

            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.01, animations: {
                self.center = bottomPosition
            })

            UIView.addKeyframe(withRelativeStartTime: 0.01, relativeDuration: 0.01, animations: {
                self.alpha = 1.0
            })

            UIView.addKeyframe(withRelativeStartTime: 0.02, relativeDuration: 0.98, animations: {
                self.center = originalButtonPosition
            })
        })
    }

    func playFlyFormBottomAnimation(duration: TimeInterval, delay: TimeInterval) {
        let originalButtonPosition = self.center
        let bottomPosition = CGPoint(x: self.center.x, y: UIScreen.main.bounds.size.height + self.frame.size.height/2.0 + 1)

        UIView.animate(withDuration: 0.01, delay: delay, options: .beginFromCurrentState, animations: {
            self.center = bottomPosition
        }) { (completed) in
            if completed {
                UIView.animate(withDuration: 0.01, delay: 0.0, options: .beginFromCurrentState, animations: {
                    self.alpha = 1.0
                }, completion: { (completed) in
                    if completed {
                        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: .beginFromCurrentState, animations: {
                            self.center = originalButtonPosition
                        })
                    }
                })
            }
        }
    }
}
