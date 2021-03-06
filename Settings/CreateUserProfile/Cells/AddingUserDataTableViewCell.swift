//
//  AddingUserDataTableViewCell.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/27/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

protocol AddPhotoButtonDelegate: class {
	func addPhotoButtonDidTap()
}

class AddingUserDataTableViewCell: UITableViewCell {
	
	private let addPhotoButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Add Photo", for: [])
		button.setTitleColor(GeneralColors.globalColor, for: [])
		button.layer.cornerRadius = 10
		button.layer.borderColor = GeneralColors.globalColor.cgColor
		button.layer.borderWidth = 1
		
		return button
	}()
	
	private let avatarImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = UIImage(named: "UserAvatarHolder")
		imageView.contentMode = .scaleAspectFill
		imageView.tintColor = GeneralColors.globalColor
		imageView.layer.cornerRadius = 10
		imageView.layer.borderColor = GeneralColors.globalColor.cgColor
		imageView.layer.borderWidth = 1
		imageView.layer.masksToBounds = true
		
		return imageView
	}()
	
	private let nameTextField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.placeholder = "Enter your name"
		
		return textField
	}()
	
	private let helperViewForTaxtField: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.layer.cornerRadius = 10
		view.layer.borderColor = GeneralColors.globalColor.cgColor
		view.layer.borderWidth = 1
		view.backgroundColor = .clear
		
		return view
	}()
	
	weak var delegate: AddPhotoButtonDelegate?
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configureView()
		setConstraints()
	}
	
	func configure(user: User?) {
		guard let user = user else { return }
		nameTextField.text = user.name
		guard let imageStr = user.avatar  else { avatarImageView.layer.borderWidth = 1; return }
		avatarImageView.sd_setImage(with: URL(string: imageStr), completed: nil)
		avatarImageView.layer.borderWidth = 0
	}
	
	func requestUpdatedName() -> String? {
		
		return nameTextField.text
	}
	
	private func configureView() {
		selectionStyle = .none
		contentView.addSubview(avatarImageView)
		contentView.addSubview(addPhotoButton)
		contentView.addSubview(helperViewForTaxtField)
		helperViewForTaxtField.addSubview(nameTextField)
		
		addPhotoButton.addTarget(self, action: #selector(addPhotoButtonPressed), for: .touchUpInside)
	}
	
	private func setConstraints() {
		
		NSLayoutConstraint.activate([
			avatarImageView.heightAnchor.constraint(equalToConstant: 100),
			avatarImageView.widthAnchor.constraint(equalToConstant: 100),
			avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
		])
		
		NSLayoutConstraint.activate([
			addPhotoButton.heightAnchor.constraint(equalToConstant: 45),
			addPhotoButton.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
			addPhotoButton.widthAnchor.constraint(equalToConstant: contentView.frame.width/3),
			addPhotoButton.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10)
		])
		
		NSLayoutConstraint.activate([
			helperViewForTaxtField.heightAnchor.constraint(equalToConstant: 45),
			helperViewForTaxtField.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
			helperViewForTaxtField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
			helperViewForTaxtField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
		])
		
		NSLayoutConstraint.activate([
			nameTextField.topAnchor.constraint(equalTo: helperViewForTaxtField.topAnchor),
			nameTextField.bottomAnchor.constraint(equalTo: helperViewForTaxtField.bottomAnchor),
			nameTextField.leadingAnchor.constraint(equalTo: helperViewForTaxtField.leadingAnchor, constant: 10),
			nameTextField.trailingAnchor.constraint(equalTo: helperViewForTaxtField.trailingAnchor, constant: 0)
		])
	}
	
	@objc func addPhotoButtonPressed() {
		delegate?.addPhotoButtonDidTap()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
