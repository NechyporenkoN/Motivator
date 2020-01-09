//
//  GeneralColors.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 12/3/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

class GeneralColors {
	static let globalColor = UIColor(red: 0, green: 0.33, blue: 0.58, alpha: 1.0)
//	static let globalColor = UIColor(red: 0.94, green: 0.50, blue: 0.50, alpha: 1.0)
	
	static let orangeColors = [
			UIColor(red:0.15, green:0.50, blue:0.01, alpha:1.0),
			UIColor(red:0.31, green:0.64, blue:0.04, alpha:1.0),
			UIColor(red:0.45, green:0.77, blue:0.07, alpha:1.0),
			UIColor(red:0.62, green:0.91, blue:0.11, alpha:1.0)
		]
	
	
	}
	
//	func gradientWithDirection(frame: CGRect, colors: [UIColor],
//														 direction: DirectionGradient) -> UIColor {
//
//		let backgroundGradientLayer = CAGradientLayer()
//		backgroundGradientLayer.frame = frame
//
//		switch direction {
//		case .rightBottomToLeftTop:
//			backgroundGradientLayer.startPoint = CGPoint(x: 1, y: 1)
//			backgroundGradientLayer.endPoint = CGPoint(x: 0, y: 0)
//		case .leftBottomToRightTop:
//			backgroundGradientLayer.startPoint = CGPoint(x: 0, y: 1)
//			backgroundGradientLayer.endPoint = CGPoint(x: 1, y: 0)
//		case .rightTopToLeftBottom:
//			backgroundGradientLayer.startPoint = CGPoint(x: 1, y: 0)
//			backgroundGradientLayer.endPoint = CGPoint(x: 0, y: 1)
//		case .leftATopToRightBottom:
//			backgroundGradientLayer.startPoint = CGPoint(x: 0, y: 0)
//			backgroundGradientLayer.endPoint = CGPoint(x: 1, y: 1)
//		case .fromBottomToTop:
//			backgroundGradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
//			backgroundGradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
//		}
//
//		let cgColors = colors.map({$0.cgColor})
//
//		backgroundGradientLayer.colors = cgColors
//
//		UIGraphicsBeginImageContext(backgroundGradientLayer.bounds.size)
//
//		if let context = UIGraphicsGetCurrentContext() {
//			backgroundGradientLayer.render(in: context)
//		}
//
//		let backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext()
//
//
//		UIGraphicsEndImageContext()
//
//		return UIColor(patternImage: backgroundColorImage ?? UIImage())
//	}
//}
