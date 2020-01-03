//
//  FamilyMembersTableViewCell.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 20.12.2019.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

class FamilyMembersTableViewCell: UITableViewCell {
	
	private var familyCollectionView: UICollectionView!
	private var dataSource: [User]? {
		didSet {
			familyCollectionView.reloadData()
			print("D I D  S E T")
		}}
//	private var familyRights: Rights?
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configureView()
		setConstraints()
	}
	
	func configure(dataSource: [User]?) {
		
		guard let dataSource = dataSource else { return }
		self.dataSource = dataSource
//		let addMember = User(name: "Add" + " " + (familyRights?.rawValue ?? ""), userID: nil, role: "", avatar: nil, familyID: nil, rights: nil)
//		self.dataSource.append(addMember)
//		dump(dataSource)
//		familyCollectionView.reloadData()
	}
	
	private func configureView() {
		
		selectionStyle = .none
//		backgroundColor = .white
		
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		familyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		familyCollectionView.translatesAutoresizingMaskIntoConstraints = false
		familyCollectionView.backgroundColor = .clear
		familyCollectionView.dataSource = self
		familyCollectionView.delegate = self
		contentView.addSubview(familyCollectionView)
		familyCollectionView.register(FamilyMemberCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: FamilyMemberCollectionViewCell.self))
//		familyCollectionView.register(FamilyAddMembersCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: FamilyAddMembersCollectionViewCell.self))
		
	}
	
	private func setConstraints() {
		
		NSLayoutConstraint.activate([
			familyCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
			familyCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			familyCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			familyCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

extension FamilyMembersTableViewCell: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return dataSource?.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FamilyMemberCollectionViewCell.self), for: indexPath) as! FamilyMemberCollectionViewCell
		cell.configure(user: dataSource?[indexPath.row])
		return cell
	}
}

extension FamilyMembersTableViewCell: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//		print(dataSource?[indexPath.row].name)
		print("TAP")
	}
}

extension FamilyMembersTableViewCell: UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 120, height: 120)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) //.zero
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
}
