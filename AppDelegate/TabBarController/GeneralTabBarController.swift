//
//  GeneralTabBarController.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/26/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit
import YXWaveView

//enum Tabs: Int {
//	case tasks = 0
//	case progress = 1
//	case prizes = 2
//	case settings = 3
//}

enum TabsTitles {
	case tasks
	case progress
	case prizes
	case settings
	
	var string: String? {
		switch self {
		case .tasks:
			return "Tasks"
		case .progress:
			return "Progress"
		case .prizes:
			return "Prizes"
		case .settings:
			return "Settings"
		}
	}
}

final class GeneralTabBarController: UITabBarController, UITabBarControllerDelegate {
	
	private var bounceAnimation: CAKeyframeAnimation = {
		let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
		bounceAnimation.values = [1.0, 1.4, 0.9, 1.02, 1.0]
		bounceAnimation.duration = TimeInterval(0.6)
		bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
		
		return bounceAnimation
	}()
	
	var backgroundView = UIView(frame: .zero)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureTabBar()
		
	}
	
	
	
	override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
		
		guard let idx = tabBar.items?.index(of: item), tabBar.subviews.count > idx + 1, let imageView = tabBar.subviews[idx + 1].subviews.compactMap({ $0 as? UIImageView }).first else { return }
		
		imageView.layer.add(bounceAnimation, forKey: nil)
	}
	
	
	fileprivate func configureTabBar() {
		UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
		UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white/*GeneralColors.globalColor*/], for: .selected)
		tabBar.unselectedItemTintColor = .white//UIColor.gray
		self.delegate = self
		tabBar.tintColor = .white
		
		//		if tabBar.selectedItem == tabBar.items?.first {
		//			backgroundView.roundCorners(corners: [.topRight], size: 35)
		//			backgroundView.backgroundColor = GeneralColors.globalColor
		//			tabBar.backgroundImage = backgroundView.asImage()
		//
		//		} else if tabBar.selectedItem == tabBar.items?.last {
		//			backgroundView.roundCorners(corners: [.topLeft], size: 35)
		//			backgroundView.backgroundColor = GeneralColors.globalColor
		//			tabBar.backgroundImage = backgroundView.asImage()
		//		}
		backgroundView = UIView(frame: tabBar.frame)
		
		backgroundView.roundCorners(corners: [.topRight], size: 35)
		backgroundView.backgroundColor = GeneralColors.globalColor
		
		tabBar.backgroundImage = backgroundView.asImage()//UIView(frame: tabBar.frame).asImage()
		//		tabBar.shadowImage = backgroundView.asImage()
		//		tabBar.shadowImage = UIImage()
		
		//		UIView.appearance().tintColor = .white//GeneralColors.globalColor
		setTabs()
	}
	
	func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
		
		
		let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
		
		backgroundView = UIView(frame: tabBar.frame)
		backgroundView.backgroundColor = GeneralColors.globalColor
		
		if selectedIndex == 0 {
			DispatchQueue.main.async {
				let transition = CATransition()
				transition.type = .fade
				transition.subtype = .fromTop
				transition.duration = 0.1
				self.backgroundView.roundCorners(corners: [.topRight], size: 35)
				self.tabBar.backgroundImage = self.backgroundView.asImage()
				self.tabBar.layer.add(transition, forKey: nil)
			}
		} else if selectedIndex == 1 {
			DispatchQueue.main.async {
				let transition = CATransition()
				transition.type = .fade
				transition.subtype = .fromTop
				transition.duration = 0.1
				self.backgroundView.roundCorners(corners: [.topRight, .topLeft], size: 35)
				self.tabBar.backgroundImage = self.backgroundView.asImage()
				self.tabBar.layer.add(transition, forKey: nil)
			}
		} else if selectedIndex == 2 {
			DispatchQueue.main.async {
				let transition = CATransition()
				transition.type = .fade
				transition.subtype = .fromTop
				transition.duration = 0.1
				self.backgroundView.roundCorners(corners: [.topRight, .topLeft], size: 35)
				self.tabBar.backgroundImage = self.backgroundView.asImage()
				self.tabBar.layer.add(transition, forKey: nil)
			}
		} else if selectedIndex == 3 {
			DispatchQueue.main.async {
				let transition = CATransition()
				transition.type = .fade
				transition.subtype = .fromTop
				transition.duration = 0.1
				self.backgroundView.roundCorners(corners: [.topLeft], size: 35)
				self.tabBar.backgroundImage = self.backgroundView.asImage()
				self.tabBar.layer.add(transition, forKey: nil)
			}
		}
	}
	
	fileprivate func setTabs() {
		let tasksController = TasksTableViewController()
		let progressController = ProgressViewController()
		let prizesController = PrizesViewController()
		let settingsController = SettingsViewController()
		
		tasksController.navigationItem.title = TabsTitles.tasks.string
		progressController.navigationItem.title = TabsTitles.progress.string
		prizesController.navigationItem.title = TabsTitles.prizes.string
		settingsController.navigationItem.title = TabsTitles.settings.string
		
		let tasksNavigationController = UINavigationController(rootViewController: tasksController)
		let progressNavigationController = UINavigationController(rootViewController: progressController)
		let prizesNavigationController = UINavigationController(rootViewController: prizesController)
		let settingsNavigationController = UINavigationController(rootViewController: settingsController)
		
		let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		let frame = CGRect(x: 0, y: 0, width: tasksNavigationController.navigationBar.frame.width, height: tasksNavigationController.navigationBar.frame.height + 20)
		let backgroundView = UIView(frame: frame)
		backgroundView.roundCorners(corners: [.bottomLeft], size: 35)
		backgroundView.backgroundColor = GeneralColors.globalColor
		
		tasksNavigationController.navigationBar.setBackgroundImage(backgroundView.asImage(), for: .default)
		tasksNavigationController.navigationBar.titleTextAttributes = textAttributes
		tasksNavigationController.navigationBar.tintColor = .white
		
		backgroundView.roundCorners(corners: [.bottomRight, .bottomLeft], size: 35)
		progressNavigationController.navigationBar.setBackgroundImage(backgroundView.asImage(), for: .default)
		progressNavigationController.navigationBar.titleTextAttributes = textAttributes
		progressNavigationController.navigationBar.tintColor = .white
		
		prizesNavigationController.navigationBar.setBackgroundImage(backgroundView.asImage(), for: .default)
		prizesNavigationController.navigationBar.titleTextAttributes = textAttributes
		prizesNavigationController.navigationBar.tintColor = .white
		
		backgroundView.roundCorners(corners: [.bottomRight], size: 35)
		settingsNavigationController.navigationBar.setBackgroundImage(backgroundView.asImage(), for: .default)
		settingsNavigationController.navigationBar.titleTextAttributes = textAttributes
		settingsNavigationController.navigationBar.tintColor = .white
		//		let frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 64)
		//		let waterView = YXWaveView(frame: frame, color: .red)
		//
		////		settingsNavigationController.navigationBar.shadowImage = UIImage()
		////		settingsNavigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
		//
		////		settingsNavigationController.navigationBar.addSubview(waterView)
		//
		////		waterView.addOverView(overView)
		//		// real wave color
		//		waterView.realWaveColor = UIColor.blue
		//
		//		// mask wave color
		//		waterView.maskWaveColor = UIColor.black
		//
		//		// wave speed (default: 0.6)
		//		waterView.waveSpeed = 0.5
		//
		//		// wave height (default: 5)
		//		waterView.waveHeight = 6
		//
		//		// wave curvature (default: 1.5)
		//		waterView.waveCurvature = 1.2
		//
		//				waterView.start()
		
		
		let tasksImage = UIImage(named: "TabBarTask")
		let progressImage = UIImage(named: "TabBarProgress")
		let prizesImage = UIImage(named: "TabBarPrizes")
		let settingsImage = UIImage(named: "TabBarSettings")
		
		let tasksTabItem = UITabBarItem(title: tasksController.navigationItem.title, image: tasksImage, selectedImage: nil)
		let progressTabItem = UITabBarItem(title: progressController.navigationItem.title, image: progressImage, selectedImage: nil)
		let prizesTabItem = UITabBarItem(title: prizesController.navigationItem.title, image: prizesImage, selectedImage: nil)
		let settingsTabItem = UITabBarItem(title: settingsController.navigationItem.title , image: settingsImage, selectedImage: nil)
		
		tasksController.tabBarItem = tasksTabItem
		progressController.tabBarItem = progressTabItem
		prizesController.tabBarItem = prizesTabItem
		settingsController.tabBarItem = settingsTabItem
		
		let tabBarControllers = [tasksNavigationController as UIViewController, progressNavigationController, prizesNavigationController, settingsNavigationController]
		
		viewControllers = tabBarControllers
	}
	
	
	
	
	
	//		func shapeWave() {
	//
	//				let view = UIView(frame: CGRect(x: 50, y: 100, width: 200, height: 300))
	//
	//				let path = UIBezierPath()
	//				path.move(to: CGPoint(x: 0.0, y: 200))
	//				path.addCurve(to: CGPoint(x: 200, y:150),
	//											controlPoint1: CGPoint(x: 50, y: 350),
	//											controlPoint2: CGPoint(x:150, y: 0))
	//				path.addLine(to: CGPoint(x: view.frame.size.width, y: view.frame.size.height))
	//				path.addLine(to: CGPoint(x: 0.0, y: view.frame.size.height))
	//				path.close()
	//
	//				let shapeLayer = CAShapeLayer()
	//				shapeLayer.path = path.cgPath
	//
	//				view.backgroundColor = UIColor.black
	//				view.layer.mask = shapeLayer
	//		//		self.view.addSubview(view)
	//			settingsNavigationController.navigationBar.addSubview(view)
	//			}
	
}

extension UIView {
	
	func roundCorners(corners:UIRectCorner, size:CGFloat){
		let path = UIBezierPath(roundedRect:self.bounds,
														byRoundingCorners:corners,
														cornerRadii: CGSize(width: size, height:  size))
		
		let maskLayer = CAShapeLayer()
		
		maskLayer.path = path.cgPath
		self.layer.mask = maskLayer
	}
}
