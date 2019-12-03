//
//  SettingsAddChildTableViewCell.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 12/3/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

class SettingsChildsTableViewCell: UITableViewCell {

	private let childTitleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .black
		label.text = "Childs"
		
		return label
	}()
 
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configureView()
		setConstraints()
	}
	
	private func configureView() {
		
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
