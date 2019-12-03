//
//  SettingsUserProfileTableViewCell.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 12/3/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

class SettingsUserProfileTableViewCell: UITableViewCell {

	private let avatarImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = UIImage(named: "UserAvatarHolder")
		imageView.contentMode = .scaleAspectFit
		imageView.tintColor = UIColor(red: 0, green: 0.33, blue: 0.58, alpha: 1.0)
		imageView.layer.cornerRadius = 10
		imageView.layer.borderColor = GeneralColors.globalColor.cgColor
		imageView.layer.borderWidth = 1
		imageView.layer.masksToBounds = true
		
		return imageView
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configureView()
		setConstraints()
	}
	
	func configure(image: UIImage?) {
		guard let image = image else { avatarImageView.layer.borderWidth = 1; return }
		avatarImageView.image = image
		avatarImageView.layer.borderWidth = 0
	}
	
	private func configureView() {
		selectionStyle = .none
		contentView.addSubview(avatarImageView)
		accessoryType = .disclosureIndicator
	}
	
	private func setConstraints() {
		
		NSLayoutConstraint.activate([
			avatarImageView.heightAnchor.constraint(equalToConstant: 100),
			avatarImageView.widthAnchor.constraint(equalToConstant: 100),
			avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
