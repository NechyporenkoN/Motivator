//
//  SettingsFamilyTableViewCell.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 12/3/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

class SettingsFamilyTableViewCell: UITableViewCell {
	
	private let childTitleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .black
//		label.text = "Family"
		
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configureView()
		setConstraints()
	}
	
	private func configureView() {
		imageView?.image = UIImage(named: "Family")
		imageView?.tintColor = .white
		imageView?.backgroundColor = UIColor(red:0.00, green:0.56, blue:0.00, alpha:1.0)
		imageView?.layer.cornerRadius = 4
					textLabel?.text = "Family"
		selectionStyle = .none
		accessoryType = .disclosureIndicator
		contentView.addSubview(childTitleLabel)
	}
	
	private func setConstraints() {
		
		NSLayoutConstraint.activate([
			childTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
			childTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			childTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
			childTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
