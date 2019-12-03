//
//  EnterPhoneNumberTableViewController.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/21/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

final class EnterPhoneNumberViewController: UIViewController {

	let backgroundImageView: UIImageView = {
			let view = UIImageView()
			view.contentMode = .scaleAspectFill
			view.image = UIImage(named: "BackgroundGradient")
			view.translatesAutoresizingMaskIntoConstraints = false
			view.backgroundColor = .white
			return view
		}()
	
	let enterPhoneLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Please confirm your country code and enter your phone number"
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: 20)
		label.lineBreakMode = .byWordWrapping
		label.numberOfLines = 0
		return label
	}()
	
	let countryButton: UIButton = {
		let button = UIButton()
		button.setTitle("Ukraine", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = .white
		button.layer.cornerRadius = 10
		button.layer.borderColor = UIColor.white.cgColor
		button.layer.borderWidth = 1
		return button
	}()
	
	let codeButton: UIButton = {
		let button = UIButton()
		button.setTitle("+380", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = .white
		button.layer.cornerRadius = 10
		button.layer.borderColor = UIColor.white.cgColor
		button.layer.borderWidth = 1
		return button
	}()
	
	let enterPhoneTextField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.textColor = .black
		textField.textAlignment = .center
		textField.placeholder = "Your phone number"
		textField.keyboardType = .numberPad
		textField.backgroundColor = .white
		textField.layer.cornerRadius = 10
		return textField
	}()
	
	private var presenter: EnterPhoneNumberPresenterDelegate?
	
	init() {
	super.init(nibName: nil, bundle: nil)
	presenter = EnterPhoneNumberPresenter(view: self)
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureView()
		configureSubviews()
	}

	private func configureView() {

		navigationController?.navigationBar.isHidden = false
		let nextButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextButtonPressed))
		navigationItem.rightBarButtonItem = nextButton
		
		
		
		view.addSubview(backgroundImageView)
		view.addSubview(enterPhoneLabel)
		view.addSubview(countryButton)
		view.addSubview(codeButton)
		view.addSubview(enterPhoneTextField)
	}

	private func configureSubviews() {
		
		NSLayoutConstraint.activate([
			backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
			backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
		])
		
		NSLayoutConstraint.activate([
			enterPhoneLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
			enterPhoneLabel.heightAnchor.constraint(equalToConstant: 100),
			enterPhoneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
			enterPhoneLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
		])
		
		NSLayoutConstraint.activate([
			countryButton.topAnchor.constraint(equalTo: enterPhoneLabel.bottomAnchor, constant: 60),
			countryButton.heightAnchor.constraint(equalToConstant: 44),
			countryButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/1.3),
			countryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
		
		
		NSLayoutConstraint.activate([
			codeButton.topAnchor.constraint(equalTo: countryButton.bottomAnchor, constant: 10),
			codeButton.heightAnchor.constraint(equalToConstant: 44),
			codeButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width/1.3)/3 - 5),
			codeButton.leadingAnchor.constraint(equalTo: countryButton.leadingAnchor)
		])
		
		NSLayoutConstraint.activate([
			enterPhoneTextField.topAnchor.constraint(equalTo: countryButton.bottomAnchor, constant: 10),
			enterPhoneTextField.heightAnchor.constraint(equalToConstant: 44),
			enterPhoneTextField.leadingAnchor.constraint(equalTo: codeButton.trailingAnchor, constant: 10),
			enterPhoneTextField.trailingAnchor.constraint(equalTo: countryButton.trailingAnchor)
		])
	}

	@objc func nextButtonPressed() {
		
		print("next")
		guard (enterPhoneTextField.text?.count ?? 0) > 0 else { enterPhoneTextField.shake(); return }
		let number = (codeButton.titleLabel?.text ?? "") + (enterPhoneTextField.text ?? "")
		presenter?.sendPhoneNumber(phoneNumber: number) { (status, message, verificationID) in
			print(status, message, verificationID)
			if status {
				let destination = EnterCodeViewController(phoneNumber: number, verificationID: verificationID)
				self.navigationController?.show(destination, sender: self)
			}
		}
		
	}
	
}

// MARK: - EnterPhoneNumberTableViewDelegate
extension EnterPhoneNumberViewController: EnterPhoneNumberViewDelegate {

}
