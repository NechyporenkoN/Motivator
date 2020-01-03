//
//  FamilyDelegates.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 20.12.2019.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import Foundation

protocol FamilyTablePresenterDelegate: class {

	var parentsDataSource: [User?] { get }
	var childsDataSource: [User?] { get }
}

protocol FamilyTableViewDelegate: class {

	func tableViewReloadData()
}
