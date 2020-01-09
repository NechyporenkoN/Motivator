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
	
	//	func shapeWave() -> UIView {
	//
	//		let view = UIView(frame: CGRect(x: 50, y: 100, width: 200, height: 300))
	//
	//		let path = UIBezierPath()
	//		path.move(to: CGPoint(x: 0.0, y: 200))
	//		path.addCurve(to: CGPoint(x: 200, y:150),
	//									controlPoint1: CGPoint(x: 50, y: 350),
	//									controlPoint2: CGPoint(x:150, y: 0))
	//		path.addLine(to: CGPoint(x: view.frame.size.width, y: view.frame.size.height))
	//		path.addLine(to: CGPoint(x: 0.0, y: view.frame.size.height))
	//		path.close()
	//
	//		let shapeLayer = CAShapeLayer()
	//		shapeLayer.path = path.cgPath
	//
	//		view.backgroundColor = UIColor.black
	//		view.layer.mask = shapeLayer
	////		self.view.addSubview(view)
	//		return view
	//	}
	
	func asImage() -> UIImage {
		let renderer = UIGraphicsImageRenderer(bounds: bounds)
		return renderer.image { rendererContext in
			layer.render(in: rendererContext.cgContext)
		}
	}
}

enum DirectionGradient {
    case rightBottomToLeftTop
    case leftBottomToRightTop
    case rightTopToLeftBottom
    case leftATopToRightBottom
    case fromBottomToTop
}

extension UIColor {
	
	func gradientWithDirection(frame: CGRect, colors: [UIColor] = GeneralColors.orangeColors,
														 direction: DirectionGradient) -> UIColor {
		
		let backgroundGradientLayer = CAGradientLayer()
		backgroundGradientLayer.frame = frame
		
		switch direction {
		case .rightBottomToLeftTop:
			backgroundGradientLayer.startPoint = CGPoint(x: 1, y: 1)
			backgroundGradientLayer.endPoint = CGPoint(x: 0, y: 0)
		case .leftBottomToRightTop:
			backgroundGradientLayer.startPoint = CGPoint(x: 0, y: 1)
			backgroundGradientLayer.endPoint = CGPoint(x: 1, y: 0)
		case .rightTopToLeftBottom:
			backgroundGradientLayer.startPoint = CGPoint(x: 1, y: 0)
			backgroundGradientLayer.endPoint = CGPoint(x: 0, y: 1)
		case .leftATopToRightBottom:
			backgroundGradientLayer.startPoint = CGPoint(x: 0, y: 0)
			backgroundGradientLayer.endPoint = CGPoint(x: 1, y: 1)
		case .fromBottomToTop:
			backgroundGradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
			backgroundGradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
		}
		
		let cgColors = colors.map({$0.cgColor})
		
		backgroundGradientLayer.colors = cgColors
		
		UIGraphicsBeginImageContext(backgroundGradientLayer.bounds.size)
		
		if let context = UIGraphicsGetCurrentContext() {
			backgroundGradientLayer.render(in: context)
		}
		
		let backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext()
		
		
		UIGraphicsEndImageContext()
		
		return UIColor(patternImage: backgroundColorImage ?? UIImage())
	}
	
	
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
