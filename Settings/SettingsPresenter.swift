//
//  SettingsPresenter.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/26/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

enum SettingsType {
	case userProfile
	case childs
	case mCoins
}

final class SettingsPresenter {
	
	private weak var view: SettingsViewDelegate?
	
	var ref: DatabaseReference!
	var currentUser: User?
	var dataSource: [[SettingsType]] = [[.userProfile], [.childs, .mCoins]]
	init(view: SettingsViewDelegate) {
		self.view = view
		
		configureObserve()
	}
	
	private func configureObserve() {
		ref = Database.database().reference()
		ref.observe(DataEventType.value, with: { [weak self] (users) in
			let usersDict = users.value as? [String : AnyObject] ?? [:]
			if let userID = Auth.auth().currentUser?.uid {
				let usersData = usersDict["users"] as? [String : AnyObject] ?? [:]
				let userById = usersData["\(userID)"] as? [String : AnyObject] ?? [:]
				let user = User(name: userById["name"] as? String, userId: userById["userID"] as? String, role: userById["role"] as? String ?? "", avatar: userById["avatarURL"] as? String)
				self?.currentUser = user
				print(self?.currentUser?.avatar)
			}
			self?.view?.tableViewReloadData()
		})
	}
	
}

// MARK: - SettingsPresenterDelegate
extension SettingsPresenter: SettingsPresenterDelegate {
	
}
