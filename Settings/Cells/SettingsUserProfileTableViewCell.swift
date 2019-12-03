//
//  SettingsUserProfileTableViewCell.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 12/3/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit
import SDWebImage

class SettingsUserProfileTableViewCell: UITableViewCell {

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
	
	private let roleTitleLabel: UILabel = {
		let label = UILabel()
		label.textColor = .black
		
		return label
	}()
	
	private let nameTitleLabel: UILabel = {
		let label = UILabel()
		label.textColor = .black
		
		return label
	}()
	
	private let infoStackView: UIStackView = {
		let stack = UIStackView()
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .fillEqually
		
		return stack
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configureView()
		setConstraints()
	}
	
	func configure(user: User?) {
		guard let user = user else { return }
		roleTitleLabel.text = user.role
		nameTitleLabel.text = user.name
		guard let imageStr = user.avatar  else { avatarImageView.layer.borderWidth = 1; return }
		avatarImageView.sd_setImage(with: URL(string: imageStr), completed: nil)
		avatarImageView.layer.borderWidth = 0
	}
	
	private func configureView() {
		selectionStyle = .none
		infoStackView.addArrangedSubview(roleTitleLabel)
		infoStackView.addArrangedSubview(nameTitleLabel)
		contentView.addSubview(infoStackView)
		contentView.addSubview(avatarImageView)
		accessoryType = .disclosureIndicator
//		accessoryView?.tintColor = GeneralColors.globalColor
		
	}
	
	private func setConstraints() {
		
		NSLayoutConstraint.activate([
			avatarImageView.heightAnchor.constraint(equalToConstant: 100),
			avatarImageView.widthAnchor.constraint(equalToConstant: 100),
			avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
		])
		
		NSLayoutConstraint.activate([
			infoStackView.heightAnchor.constraint(equalToConstant: 100),
			infoStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			infoStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
			infoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
			
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
