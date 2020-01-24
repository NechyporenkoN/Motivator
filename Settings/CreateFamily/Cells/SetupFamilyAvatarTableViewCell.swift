//
//  SetupFamilyAvatarTableViewCell.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 04.01.2020.
//  Copyright © 2020 Nikita Nechyporenko. All rights reserved.
//

import UIKit

protocol SetupFamilyAvatarTableViewCellDelegate: class {
	func deleteButtonDidTap()
}

class SetupFamilyAvatarTableViewCell: UITableViewCell {
	

	
	private let avatarImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.clipsToBounds = true
		imageView.image = UIImage(named: "BackgroundGradient")
		
		return imageView
	}()
	
	var delegate: SetupFamilyAvatarTableViewCellDelegate?
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configureView()
		setConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configureView() {
		
		contentView.addSubview(avatarImageView)
//		avatarImageView.addSubview(deleteAvatarButton)
//		deleteAvatarButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
		selectionStyle = .none
	}
	
	private func setConstraints() {
		
		NSLayoutConstraint.activate([
			avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
		])
		
		NSLayoutConstraint.activate([
//			deleteAvatarButton.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
//			deleteAvatarButton.widthAnchor.constraint(equalToConstant: 24),
//			deleteAvatarButton.heightAnchor.constraint(equalToConstant: 24),
//			deleteAvatarButton.trailingAnchor.constraint(equalTo: avatarImageView.trailingAnchor)
		])
	}
	
	@objc func deleteButtonPressed() {
		delegate?.deleteButtonDidTap()
	}
}
