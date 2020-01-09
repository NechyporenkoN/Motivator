//
//  SettingsCoinsTableViewCell.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 12/3/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

class SettingsCoinsTableViewCell: UITableViewCell {
	
	private let coinsTitleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .black
//		label.text = "Coins"
		
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configureView()
		setConstraints()
	}
	
	private func configureView() {
		imageView?.image = UIImage(named: "Coin")
		imageView?.tintColor = .white
		imageView?.backgroundColor = .orange
		imageView?.layer.cornerRadius = 4
				textLabel?.text = "Coins"
		selectionStyle = .none
		accessoryType = .disclosureIndicator
		contentView.addSubview(coinsTitleLabel)
	}
	
	private func setConstraints() {
		
		NSLayoutConstraint.activate([
			coinsTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
			coinsTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			coinsTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
			coinsTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
