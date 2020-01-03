//
//  FamilyAvatarTableViewCell.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 03.01.2020.
//  Copyright © 2020 Nikita Nechyporenko. All rights reserved.
//

import UIKit

class FamilyAvatarTableViewCell: UITableViewCell {
	
	private let avatarImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.clipsToBounds = true
		imageView.image = UIImage(named: "BackgroundGradient")
		
		return imageView
	}()
	
	private let labelStackView: UIStackView = {
		let stack = UIStackView()
		stack.axis = .vertical
		stack.alignment = .bottom
		stack.translatesAutoresizingMaskIntoConstraints = false
		
		return stack
	}()
	
	private let fullNameLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 32, weight: .regular)
		label.textColor = .white
		label.textAlignment = .right
		label.layer.shadowColor = UIColor.black.cgColor
		label.layer.shadowOpacity = 0.40
		label.layer.shadowOffset = CGSize(width: 1, height: 1)
		label.layer.masksToBounds = false
		
		return label
	}()
	
	private let phoneNumberLabel: UILabel = {
		let label = UILabel()
		label.textColor = .white
		label.textAlignment = .right
		label.layer.shadowColor = UIColor.black.cgColor
		label.layer.shadowOpacity = 0.40
		label.layer.shadowOffset = CGSize(width: 1, height: 1)
		label.layer.masksToBounds = false
		
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configureView()
		setConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configureView() {
		
		labelStackView.addArrangedSubview(fullNameLabel)
		labelStackView.addArrangedSubview(phoneNumberLabel)
		
		contentView.addSubview(avatarImageView)
		contentView.addSubview(labelStackView)
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
			labelStackView.trailingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: -15),
			labelStackView.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: -15),
			labelStackView.leadingAnchor.constraint(greaterThanOrEqualTo: avatarImageView.leadingAnchor, constant: 15)
		])
	}
	
	
	private func attributeStringMaker(_ phoneNumber: String?, _ email: String?, _ lang: String?) -> NSAttributedString {
		let lang = lang?.capitalized
		let spacing = lang == nil ? "" : " "
		let readyString = NSMutableAttributedString()
		let boldFontAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]
		let normalFontAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
		let firstPart = NSMutableAttributedString(string: phoneNumber ?? email ?? "", attributes: normalFontAttributes)
		let secondPart = NSMutableAttributedString(string: lang ?? "", attributes: boldFontAttributes)
		let space = NSMutableAttributedString(string: spacing, attributes: boldFontAttributes)
		readyString.append(firstPart)
		readyString.append(space)
		readyString.append(secondPart)
		return readyString
	}
	
	func configure(family: Family?) {
		fullNameLabel.text = family?.name
		phoneNumberLabel.attributedText = attributeStringMaker("$$$$", nil, "&&&")
		guard let family = family, let urlString = family.avaterURL, let url = URL(string: urlString) else { return }
		print(url)
		avatarImageView.sd_setImage(with: url, placeholderImage: nil)
	}
	
}
