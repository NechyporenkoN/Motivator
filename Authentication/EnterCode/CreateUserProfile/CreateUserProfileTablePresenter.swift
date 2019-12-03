//
//  CreateUserProfileTablePresenter.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/27/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

final class CreateUserProfileTablePresenter {
	
	private weak var view: CreateUserProfileTableViewDelegate?
	
	var ref: DatabaseReference?
	
	var familyRole: FamilyRoleRow? //{ didSet { view?.reloadData() }}
	
	init(view: CreateUserProfileTableViewDelegate) {
		self.view = view
		
	}
	
	private func roleMaker() -> String {
		switch familyRole {
		case .father:
			return FamilyRole.dad.rawValue
		case .mother:
			return FamilyRole.mom.rawValue
		case .son:
			return FamilyRole.son.rawValue
		case .daughter:
			return FamilyRole.daughter.rawValue
		case .none:
			return ""
		}
	}
	
	func createUsers() {
		
		guard let userID = Auth.auth().currentUser?.uid else { return }
		
		ref = Database.database().reference()
		ref?.child("users").child(userID).setValue(["role": roleMaker()]) { [weak self] (error: Error?, ref: DatabaseReference) in
			if let error = error {
				print("Data could not be saved: \(error).")
			} else {
				print("Data saved successfully!")
				self?.view?.setAndShowGeneralController()
			}
		}
	}
}

// MARK: - CreateUserProfileTablePresenterDelegate
extension CreateUserProfileTablePresenter: CreateUserProfileTablePresenterDelegate {
	
}
