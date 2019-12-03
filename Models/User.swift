//
//  User.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/26/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import Foundation

enum FamilyRole: String {
	case dad = "dad"
	case mom = "mom"
	case son = "son"
	case daughter = "daughter"
}

final class User {
	var name: String?
	var userId: String?
	var role: String?
	var avatar: String?
	
	init(name: String?, userId: String?, role: String, avatar: String?) {
		self.name = name
		self.userId = userId
		self.role = role
		self.avatar = avatar
		
		
	}
}
