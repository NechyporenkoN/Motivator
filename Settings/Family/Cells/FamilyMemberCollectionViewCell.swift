//
//  FamilyMemberCollectionViewCell.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 20.12.2019.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

class FamilyMemberCollectionViewCell: UICollectionViewCell {
	
	private let deleteButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.layer.borderWidth = 1.5
		button.layer.borderColor = GeneralColors.globalColor.cgColor//GeneralColors.navigationBlueColor.cgColor
		button.setTitle("X", for: .normal)
		button.backgroundColor = GeneralColors.navigationBlueColor//GeneralColors.globalColor
//		button.titleLabel?.textColor = GeneralColors.globalColor//navigationBlueColor
		button.layer.cornerRadius = 15
		button.setTitleColor( GeneralColors.globalColor, for: .normal)
		return button
	}()
	
	let avatarImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.layer.cornerRadius = 10
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
		
		return imageView
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = GeneralColors.globalColor
		label.textAlignment = .center
		
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureView()
		setConstraints()
	}
	
	func configure(user: User?, isEditing: Bool?) {
		
		nameLabel.text = user?.name
		if let avatar = user?.avatar {
			avatarImageView.sd_setImage(with: URL(string: avatar), completed: nil)
			avatarImageView.layer.borderWidth = 0
		}else {
			avatarImageView.image = UIImage(named: "UserAvatarHolder")
			avatarImageView.layer.borderColor = GeneralColors.globalColor.cgColor
			avatarImageView.layer.borderWidth = 4
		}
		
		if isEditing ?? false {
			deleteButton.isHidden = false
		} else {
			deleteButton.isHidden = true
		}
	}
	
	private func configureView() {
		contentView.addSubview(avatarImageView)
		contentView.addSubview(nameLabel)
		contentView.addSubview(deleteButton)
//		deleteButton.layer.cornerRadius = deleteButton.frame.width/2
		deleteButton.isHidden = true
	}
	
	private func setConstraints() {
		NSLayoutConstraint.activate([
			avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			avatarImageView.heightAnchor.constraint(equalToConstant: 100),
			avatarImageView.widthAnchor.constraint(equalToConstant: 100),
			avatarImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
		])
		
		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 6),
			nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
		])
		
		NSLayoutConstraint.activate([
			deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -4),
			deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
			deleteButton.heightAnchor.constraint(equalToConstant: 30),
			deleteButton.widthAnchor.constraint(equalToConstant: 30)
		])
	}
	
	override func prepareForReuse() {
		avatarImageView.image = nil
		nameLabel.text = nil
		deleteButton.isHidden = true
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
