//
//  CreateUserProfileTableDelegates.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/27/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

protocol CreateUserProfileTablePresenterDelegate: class {
	
	var familyRole: FamilyRoleRow? { get set }
	
	func createUsers()
}

protocol CreateUserProfileTableViewDelegate: class {
	
	var avatarImage: UIImage? { get }
//	func reloadData()
	func setAndShowGeneralController()
}
