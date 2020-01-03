//
//  AppDelegate.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/21/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	var tabBarController: GeneralTabBarController?
	let viewController = StartViewController()
	var navigationController = UINavigationController()
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		FirebaseApp.configure()
		Database.database().isPersistenceEnabled = true
		
		setRootViewController()

		return true
	}
	
	private func setRootViewController() {
		if isLoggedIn() {
					if tabBarController == nil {
						tabBarController = GeneralTabBarController()
					}
		//			navigationController = UINavigationController(rootViewController: tabBarController ?? UIViewController())
		//			navigationController.navigationBar.isHidden = true
		//			window?.rootViewController = GeneralTabBarController()
					window = UIWindow(frame: UIScreen.main.bounds)
					window?.rootViewController = GeneralTabBarController()
					window?.makeKeyAndVisible()
				} else {
					navigationController = UINavigationController(rootViewController: viewController)
					navigationController.navigationBar.shadowImage = UIImage()
					navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
					window = UIWindow(frame: UIScreen.main.bounds)
					window?.rootViewController = navigationController
					window?.makeKeyAndVisible()
				}
		//		UITabBar.appearance().isTranslucent = false
		//		UITabBar.appearance().clipsToBounds = true
		//		UINavigationBar.appearance().barTintColor = .red
//					UINavigationBar.appearance().shadowImage = UIImage()
		//			UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
				//		UIView.appearance().tintColor = UIColor.red
		//		window = UIWindow(frame: UIScreen.main.bounds)
		//		window?.rootViewController = navigationController
		//		window?.makeKeyAndVisible()
		window?.backgroundColor = .white
	}
	
	private func isLoggedIn() -> Bool {
		return Auth.auth().currentUser != nil
	}
	
	 func setGeneralRootViewController() {

//		var navigationController = UINavigationController()
//		navigationController = UINavigationController(rootViewController: GeneralTabBarController())
		window?.rootViewController = GeneralTabBarController()
		window?.makeKeyAndVisible()
		window?.backgroundColor = .white
	}
	
	func setSelectRoleRootViewController() {

		var navigationController = UINavigationController()
		navigationController = UINavigationController(rootViewController: SelectFamilyRoleTableViewController(familyRights: nil, authType: .registration))
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
		window?.backgroundColor = .white
//		navigationController.setNavigationShadowHidden(true)
	}
	
	// MARK: UISceneSession Lifecycle
	
	//	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
	//		// Called when a new scene session is being created.
	//		// Use this method to select a configuration to create the new scene with.
	//		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	//	}
	//
	//	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
	//		// Called when the user discards a scene session.
	//		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
	//		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	//	}
	
	
}

