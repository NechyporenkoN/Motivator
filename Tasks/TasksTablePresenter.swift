//
//  TasksTablePresenter.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/26/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import Foundation
//import TopTalkCore

final class TasksTablePresenter {

	private weak var view: TasksTableViewDelegate?

	var dataSource = [
		Task(taskID: nil, taskName: nil, taskBody: nil, comment: nil, price: nil, deadline: nil, status: StatusTask.active.rawValue, imageURL: nil),
		Task(taskID: nil, taskName: nil, taskBody: nil, comment: nil, price: nil, deadline: nil, status: StatusTask.active.rawValue, imageURL: nil),
		Task(taskID: nil, taskName: nil, taskBody: nil, comment: nil, price: nil, deadline: nil, status: StatusTask.ready.rawValue, imageURL: nil),
		Task(taskID: nil, taskName: nil, taskBody: nil, comment: nil, price: nil, deadline: nil, status: StatusTask.unfulfilled.rawValue, imageURL: nil),
		Task(taskID: nil, taskName: nil, taskBody: nil, comment: nil, price: nil, deadline: nil, status: StatusTask.awaiting.rawValue, imageURL: nil),
		Task(taskID: nil, taskName: nil, taskBody: nil, comment: nil, price: nil, deadline: nil, status: StatusTask.awaiting.rawValue, imageURL: nil),
		Task(taskID: nil, taskName: nil, taskBody: nil, comment: nil, price: nil, deadline: nil, status: StatusTask.active.rawValue, imageURL: nil),
		Task(taskID: nil, taskName: nil, taskBody: nil, comment: nil, price: nil, deadline: nil, status: StatusTask.ready.rawValue, imageURL: nil),
		Task(taskID: nil, taskName: nil, taskBody: nil, comment: nil, price: nil, deadline: nil, status: StatusTask.unfulfilled.rawValue, imageURL: nil),
		Task(taskID: nil, taskName: nil, taskBody: nil, comment: nil, price: nil, deadline: nil, status: StatusTask.awaiting.rawValue, imageURL: nil),
	]

	init(view: TasksTableViewDelegate) {
		self.view = view
		configureCoreSerivces()
	}
	
	private func configureCoreSerivces() {
		
	}
}

// MARK: - TasksPresenterDelegate
extension TasksTablePresenter: TasksTablePresenterDelegate {

}
