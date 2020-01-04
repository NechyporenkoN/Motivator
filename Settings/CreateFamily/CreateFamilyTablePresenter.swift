//
//  CreateFamilyTablePresenter.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 04.01.2020.
//  Copyright © 2020 Nikita Nechyporenko. All rights reserved.
//

import Foundation
//import TopTalkCore

final class CreateFamilyTablePresenter {

	private weak var view: CreateFamilyTableViewDelegate?

	// private var authCoreSerivce: AuthCoreService?

	init(view: CreateFamilyTableViewDelegate) {
		self.view = view
		configureCoreSerivces()
	}
	private func configureCoreSerivces() {
		//	authCoreSerivce = AuthCoreServices()
	}
}

// MARK: - CreateFamilyTablePresenterDelegate
extension CreateFamilyTablePresenter: CreateFamilyTablePresenterDelegate {

}
