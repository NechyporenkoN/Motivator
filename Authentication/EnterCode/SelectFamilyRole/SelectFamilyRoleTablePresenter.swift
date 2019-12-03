//
//  SelectFamilyRoleTablePresenter.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/28/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

enum FamilyRoleSection {
	case parents(rows: [FamilyRoleRow])
	case childs(rows: [FamilyRoleRow])
	var rows: [FamilyRoleRow] {
		switch self {
		case .parents(let rows), .childs(let rows):
			return rows
		}
	}
}

enum FamilyRoleRow: String {
	case father = "Father"
	case mother = "Mother"
//	case other = "Other"
	case son = "Son"
	case daughter = "Daughter"
}

final class SelectFamilyRoleTablePresenter {
	
	private weak var view: SelectFamilyRoleTableViewDelegate?
	var ref: DatabaseReference?
	var familyRole: FamilyRoleRow?
	var dataSource = [
		FamilyRoleSection.parents(rows: [.father, .mother]),
		FamilyRoleSection.childs(rows: [.son, .daughter])
	]
	
	init(view: SelectFamilyRoleTableViewDelegate) {
		self.view = view
	}
	
	private func roleMaker() -> String {
		guard let familyRole = familyRole else { return ""}
	switch familyRole {
	case .father:
		return FamilyRole.dad.rawValue
	case .mother:
		return FamilyRole.mom.rawValue
	case .son:
		return FamilyRole.son.rawValue
	case .daughter:
		return FamilyRole.daughter.rawValue
	}
}
	
	func createUsers() {
		view?.spinnerStartAnimate()
		guard let userID = Auth.auth().currentUser?.uid else { view?.spinnerStopAnimate(); return }
		
		ref = Database.database().reference()
		ref?.child("users").child(userID).setValue(["role": roleMaker(), "userID": userID]) { [weak self] (error: Error?, ref: DatabaseReference) in
			if let error = error {
				print("Data could not be saved: \(error).")
			} else {
				print("Data saved successfully!")
				self?.view?.setAndShowGeneralController()
				self?.view?.spinnerStopAnimate()
			}
		}
	}
	
}

// MARK: - SelectFamilyRoleTablePresenterDelegate
extension SelectFamilyRoleTablePresenter: SelectFamilyRoleTablePresenterDelegate {
	
}
