//
//  SettingsPresenter.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/26/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import Foundation
//import TopTalkCore

enum SettingsType {
	case userProfile
	case addChild
	case childs
	case mCoins
}

final class SettingsPresenter {

	private weak var view: SettingsViewDelegate?

	// private var authCoreSerivce: AuthCoreService?

	init(view: SettingsViewDelegate) {
		self.view = view
		configureCoreSerivces()
	}
	private func configureCoreSerivces() {
		//	authCoreSerivce = AuthCoreServices()
	}
}

// MARK: - SettingsPresenterDelegate
extension SettingsPresenter: SettingsPresenterDelegate {

}
