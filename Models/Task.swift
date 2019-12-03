//
//  Task.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/27/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import Foundation

enum StatusTask {
	case active
	case approve
	case ready
	case unfulfilled
}

final class Task {
	
	var taskID: String?
	var taskName: String?
	var taskBody: String?
	var comment: String?
	var price: String?
	var deadline: String?
	var status: StatusTask?
	var imageURL: String?
	
	init(taskID: String?, taskName: String?, taskBody: String?, comment: String? = nil, price: String?, deadline: String?, status: StatusTask?, imageURL: String? = nil) {
		self.taskID = taskID
		self.taskName = taskName
		self.taskBody = taskBody
		self.comment = comment
		self.price = price
		self.deadline = deadline
		self.status = status
		self.imageURL = imageURL
	}
}
