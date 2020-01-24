//
//  SettingsCoinsTableViewCell.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 12/3/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
	
	private let titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .black
		//		label.text = "Motivation Star"
		
		return label
	}()
	
	private let iconImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFill
		//		imageView.image = UIImage(named: "Star")
		
		return imageView
	}()
	
	 var helperBackgroundView = UIView()
	 var cornerRect: UIRectCorner?
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configureView()
		setConstraints()
	}
	
	func configure(title: String?, iconName: String?) {
		if let title = title {
			titleLabel.text = title
		}
		if let iconName = iconName {
			iconImageView.image = UIImage(named: iconName)
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		helperBackgroundView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 20, height: self.frame.height)
		guard let cornerRect = cornerRect else { return }
		helperBackgroundView.roundCorners(corners: [cornerRect], size: 30)
	}
	
	private func configureView() {
		
		contentView.backgroundColor = .clear
		self.backgroundColor = .clear
		helperBackgroundView.backgroundColor = GeneralColors.navigationBlueColor
		contentView.addSubview(helperBackgroundView)
		helperBackgroundView.addSubview(iconImageView)
		selectionStyle = .none
		helperBackgroundView.addSubview(titleLabel)
	}
	
	private func setConstraints() {
		
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: helperBackgroundView.topAnchor),
			titleLabel.bottomAnchor.constraint(equalTo: helperBackgroundView.bottomAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: helperBackgroundView.trailingAnchor, constant: -16),
			titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16)
		])
		
		NSLayoutConstraint.activate([
			iconImageView.centerYAnchor.constraint(equalTo: helperBackgroundView.centerYAnchor),
			iconImageView.widthAnchor.constraint(equalToConstant: 32),
			iconImageView.heightAnchor.constraint(equalToConstant: 32),
			iconImageView.leadingAnchor.constraint(equalTo: helperBackgroundView.leadingAnchor, constant: 16)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
