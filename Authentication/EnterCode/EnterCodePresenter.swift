//
//  EnterCodePresenter.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/22/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import Foundation
import FirebaseAuth

final class EnterCodePresenter {

	private weak var view: EnterCodeViewDelegate?

	var verificationID: String?
 	var phoneNumber: String?
	var verificationCode = ""
	
	init(view: EnterCodeViewDelegate, phoneNumber: String?, verificationID: String?) {
		self.view = view
		self.phoneNumber = phoneNumber
		self.verificationID = verificationID
		configureCoreSerivces()
	}
	private func configureCoreSerivces() {
		//	authCoreSerivce = AuthCoreServices()
	}
}

// MARK: - EnterCodePresenterDelegate
extension EnterCodePresenter: EnterCodePresenterDelegate {

	func checkPhoneCode() {
		
		guard let verificationID = verificationID, verificationCode.count == 6 else { return }
		
		let credential = PhoneAuthProvider.provider().credential(
    withVerificationID: verificationID,
    verificationCode: verificationCode)
		
		Auth.auth().signIn(with: credential) { [weak self] (authResult, error) in
			print(authResult?.user.displayName)
			if let error = error {
				self?.view?.showAlert(message: error.localizedDescription)
				return
			}
//			else if authResult?.user.displayName == nil {
//				self?.view?.showAlert(message: "no name")
//				return
//			}
			else {
				self?.view?.showSelectFamilyRoleController()
			}
		}
	}
}
