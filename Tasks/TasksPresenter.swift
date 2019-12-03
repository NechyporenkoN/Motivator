//
//  TasksPresenter.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/26/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import Foundation
//import TopTalkCore

final class TasksPresenter {

	private weak var view: TasksViewDelegate?

	// private var authCoreSerivce: AuthCoreService?

	init(view: TasksViewDelegate) {
		self.view = view
		configureCoreSerivces()
	}
	private func configureCoreSerivces() {
		//	authCoreSerivce = AuthCoreServices()
	}
}

// MARK: - TasksPresenterDelegate
extension TasksPresenter: TasksPresenterDelegate {

}
