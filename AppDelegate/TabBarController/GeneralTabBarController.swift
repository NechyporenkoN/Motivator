//
//  GeneralTabBarController.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/26/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

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

final class GeneralTabBarController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
    configureTabBar()

	}
	
	fileprivate func configureTabBar() {
		UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
		UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: GeneralColors.globalColor], for: .selected)
   	tabBar.unselectedItemTintColor = UIColor.gray
		UIView.appearance().tintColor = GeneralColors.globalColor
    setTabs()
  }

  fileprivate func setTabs() {
		let tasksController = TasksViewController()
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
}
