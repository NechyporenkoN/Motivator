//
//  FamilyMemberCollectionViewCell.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 20.12.2019.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

class FamilyMemberCollectionViewCell: UICollectionViewCell {
	
	let avatarImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.layer.cornerRadius = 50
		imageView.contentMode = .scaleAspectFill
		imageView.layer.masksToBounds = true
		
		return imageView
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .black
		label.textAlignment = .center
		
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureView()
		setConstraints()
	}
	
	func configure(user: User?) {
//		guard let user = user else { return }
		
		nameLabel.text = user?.name
		if let avatar = user?.avatar {
			avatarImageView.sd_setImage(with: URL(string: avatar), completed: nil)
			
			avatarImageView.layer.borderWidth = 0
		}
//		else if user?.role == "" {
//			avatarImageView.image = UIImage(named: "Plus")
//			nameLabel.text = user?.name
//		}
		else {
			avatarImageView.image = UIImage(named: "UserAvatarHolder")
//			nameLabel.text = "User"
			avatarImageView.layer.borderColor = GeneralColors.globalColor.cgColor
			avatarImageView.layer.borderWidth = 4
			
		}
		
	}
	
	private func configureView() {
		contentView.addSubview(avatarImageView)
		contentView.addSubview(nameLabel)
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
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
