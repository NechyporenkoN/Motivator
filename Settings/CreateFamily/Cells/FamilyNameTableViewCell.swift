//
//  FamilyNameTableViewCell.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 04.01.2020.
//  Copyright © 2020 Nikita Nechyporenko. All rights reserved.
//

import UIKit

class FamilyNameTableViewCell: JoinFamilyIDTableViewCell {

	func configure() {
		titleFamilyID.text = "Plase enter family name"
		familyIDTextField.placeholder = "family name"
	}
}
