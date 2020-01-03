//
//  Extensions.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/22/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

extension UIView {
	
	func shake(for duration: TimeInterval = 0.35, withTranslation translation: CGFloat = 7) {

		let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
		notificationFeedbackGenerator.prepare()


		let propertyAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.3) {
			self.transform = CGAffineTransform(translationX: translation, y: 0)
		}

		propertyAnimator.addAnimations({
			self.transform = CGAffineTransform(translationX: 0, y: 0)
		}, delayFactor: 0.2)

		propertyAnimator.startAnimation()
		notificationFeedbackGenerator.notificationOccurred(.error)
	}
}

extension UIColor {
	
	func generalStyleColor() -> UIColor {
	 return UIColor(red: 0, green: 0.33, blue: 0.58, alpha: 1.0)
	}
}

//extension UINavigationController {
//	func setNavigationShadowHidden(_ state: Bool) {
//
//		if state {
//			if #available(iOS 13.0, *) {
//				navigationBar.standardAppearance.shadowColor = .clear
//				navigationBar.compactAppearance?.shadowColor = .clear
//				navigationBar.scrollEdgeAppearance?.shadowColor = .clear
//			}
//		}
//
//		navigationBar.setValue(state, forKey: "hidesShadow")
//	}
//}
