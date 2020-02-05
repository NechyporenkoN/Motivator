//
//  CreateNewTaskPresenter.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 04.02.2020.
//  Copyright © 2020 Nikita Nechyporenko. All rights reserved.
//

import Foundation
//import TopTalkCore

final class CreateNewTaskPresenter {

	private weak var view: CreateNewTaskViewDelegate?

	// private var authCoreSerivce: AuthCoreService?

	init(view: CreateNewTaskViewDelegate) {
		self.view = view
		configureCoreSerivces()
	}
	private func configureCoreSerivces() {
		//	authCoreSerivce = AuthCoreServices()
	}
}

// MARK: - CreateNewTaskPresenterDelegate
extension CreateNewTaskPresenter: CreateNewTaskPresenterDelegate {

}
