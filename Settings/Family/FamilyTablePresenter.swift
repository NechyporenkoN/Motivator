//
//  FamilyTablePresenter.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 20.12.2019.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

enum FamilySection {
	case avatar
	case parents
	case childs
}

final class FamilyTablePresenter {
	
	private weak var view: FamilyTableViewDelegate?
	
	var dataSource: [FamilySection] = []
	var parentsDataSource: [User?] = []
	var childrenDataSource: [User?] = []
	var currentUser: User?
	var family: Family?
	var ref: DatabaseReference!
	
	init(view: FamilyTableViewDelegate, currentUser: User?) {
		self.view = view
		self.currentUser = currentUser
		
		configureObserve()
		//		configureDataSource()
		
	}
	
	private func configureDataSource() {
		dataSource = [.avatar, .parents, .childs]
		
		guard let members = family?.members else { return }

		parentsDataSource = []
		childrenDataSource = []
		for member in members {
			ref.child("users").child(member).observeSingleEvent(of: .value, with: { [weak self] (user) in
				let value = user.value as? NSDictionary
				let name = value?["name"] as? String
				let userID = value?["userID"] as? String
				let role = value?["role"] as? String ?? ""
				let avatar = value?["avatarURL"] as? String
				let familyID = value?["familyID"] as? String
				let rights = value?["rights"] as? String
				let user = User(name: name, userID: userID, role: role, avatar: avatar, familyID: familyID, rights: rights)
//				print(user.name)
				if rights == "parent" {
						self?.parentsDataSource.append(user)
					
				} else if rights == "child" {
					self?.childrenDataSource.append(user)
				}
//				dump(user)
				self?.view?.tableViewReloadData()
			}) { (error) in
				print(error.localizedDescription)
			}
		}
	}
	
	private func configureObserve() {
		ref = Database.database().reference()
		ref.observe(DataEventType.value, with: { [weak self] (families) in
			let familiesDict = families.value as? [String : AnyObject] ?? [:]
			if let familyID =  self?.currentUser?.familyID {
				let familiesData = familiesDict["families"] as? [String : AnyObject] ?? [:]
				let familyById = familiesData["\(familyID)"] as? [String : AnyObject] ?? [:]
				let family = Family(name: familyById["name"] as? String,
														ownerID: familyById["ownerID"] as? String,
														familyID: familyById["familyID"] as? String ?? "",
														members: familyById["members"] as? [String],
														avaterURL: familyById["avatarURL"] as? String,
														logoURL: familyById["logoURL"] as? String)
				self?.family = family
//				dump(family)
				if family.familyID == self?.currentUser?.userID {
					self?.view?.setBarButton()
				}
			}
			self?.configureDataSource()
		})
	}
	
	
}

// MARK: - FamilyTablePresenterDelegate
extension FamilyTablePresenter: FamilyTablePresenterDelegate {
	
}
