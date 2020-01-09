//
//  TaskTableViewCell.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 09.01.2020.
//  Copyright © 2020 Nikita Nechyporenko. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
	
	static let height: CGFloat = 120
	private let width: CGFloat = UIScreen.main.bounds.size.width
	private var helperBackgroundView: UIView?
	private var helperContentView: UIView?
	private var typeLabel = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configureView()
		setConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configureView() {
		selectionStyle = .none
		accessoryType = .none
		
		helperBackgroundView = UIView(frame: CGRect(x: 0, y: 6, width: width, height: TaskTableViewCell.height))
		helperBackgroundView?.backgroundColor = UIColor(red:0.15, green:0.50, blue:0.01, alpha:1.0)
		helperBackgroundView?.roundCorners(corners: [.bottomLeft, . topRight], size: 35)
		contentView.addSubview(helperBackgroundView ?? UIView())
	
		helperContentView = UIView(frame: CGRect(x: 26, y: 8, width: width - 28, height: TaskTableViewCell.height - 4))
		helperContentView?.backgroundColor = .white
		helperContentView?.alpha = 0.8
		helperContentView?.roundCorners(corners: [.bottomLeft, . topRight], size: 35)
		contentView.addSubview(helperContentView ?? UIView())
		
		typeLabel.translatesAutoresizingMaskIntoConstraints = false
		typeLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
		typeLabel.text = "Active"
		typeLabel.textAlignment = .center
		typeLabel.textColor = .white
		contentView.addSubview(typeLabel)
	}
	
	private func setConstraints() {
					NSLayoutConstraint.activate([
						typeLabel.heightAnchor.constraint(equalToConstant: 20),
						typeLabel.widthAnchor.constraint(equalToConstant: TaskTableViewCell.height - 20),
						typeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
						typeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: -36)
//						helperView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
//						helperView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
//						helperView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
//						helperView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6)
					])
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		//		helperView = UIView(frame: CGRect(x: 6, y: 6, width: self.frame.width - 12, height: self.frame.height - 12))
		//		helperView.roundCorners(corners: [.bottomLeft, . topRight], size: 35)
		//		helperView.backgroundColor = .green
	}
}
