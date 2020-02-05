//
//  FamilyTableViewController.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 20.12.2019.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit
//import YXWaveView

final class FamilyTableViewController: UITableViewController {
	
	private var presenter: FamilyTablePresenterDelegate?
	
	init(currentUser: User?) {
		super.init(style: .grouped)
		presenter = FamilyTablePresenter(view: self, currentUser: currentUser)
		hidesBottomBarWhenPushed = true
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureView()
		configureSubviews()
	}
	
	private func configureView() {
		
		navigationItem.title = "Family"
		
		
		tableView.separatorStyle = .none
		tableView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: -10)
		tableView.backgroundColor = .darkGray
		tableView.register(FamilyMembersTableViewCell.self, forCellReuseIdentifier: String(describing: FamilyMembersTableViewCell.self))
		tableView.register(FamilyAvatarTableViewCell.self, forCellReuseIdentifier: String(describing: FamilyAvatarTableViewCell.self))
		
	}
	
	
	
	private func showActionSheet() {
		
		let alert = UIAlertController(title: "Who do you want to invite?", message: nil, preferredStyle: .actionSheet)
		
		let message = "Hey, invite you to join our family"
		var textToShare = [ message ]
		if let familyID = presenter?.family?.familyID {
			textToShare.append(familyID)
		}
		let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
		activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
		activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
		
		let parentAction = UIAlertAction(title: "Parent", style: .default) { [weak self] (action) in
			self?.present(activityViewController, animated: true, completion: nil)
		}
		let childAction = UIAlertAction(title: "Child", style: .default) { [weak self] (action) in
			self?.present(activityViewController, animated: true, completion: nil)
		}
		
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		alert.addAction(parentAction)
		alert.addAction(childAction)
		present(alert, animated: true, completion: nil)
	}
	
	private func configureSubviews() {
		//view.addSubview
		//constraints
	}
	
	override func setEditing(_ editing: Bool, animated: Bool) {
		super.setEditing(editing, animated: animated)
		tableView.reloadData()//reloadSections([0, 1, 2], with: .automatic)
//		guard editing else { return }
//		showActionSheet()
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return presenter?.dataSource.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let section = presenter?.dataSource[indexPath.section] else { return UITableViewCell()}
		switch section {
		case .avatar:
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FamilyAvatarTableViewCell.self), for: indexPath) as! FamilyAvatarTableViewCell
			cell.configure(family: presenter?.family, isEditing: tableView.isEditing)
			return cell
		case .parents:
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FamilyMembersTableViewCell.self), for: indexPath) as! FamilyMembersTableViewCell
			cell.configure(dataSource: presenter?.parentsDataSource as? [User], isEditing: false)
			return cell
		case .childs:
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FamilyMembersTableViewCell.self), for: indexPath) as! FamilyMembersTableViewCell
			cell.configure(dataSource: presenter?.childrenDataSource as? [User], isEditing: tableView.isEditing)
			return cell
		}
		
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return indexPath.section == 0 ? 200 : 150
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return section == 0 ? "" : section == 1 ? "Parents" : "Children"
	}
	
	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return section == 0 ? 10 : 30
	}
	
	override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return nil
	}
	
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		return nil
	}
	
	override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 0
	}
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return false
	}
	
	override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
			if let header = view as? UITableViewHeaderFooterView {
				header.textLabel?.textColor = GeneralColors.navigationBlueColor
			}
	}

	
	//	@objc func editButtonPressed() {
	//
	//		setEditing(true, animated: true)
	//
	//	}
	
	@objc func addButtonPressed() {
		
		showActionSheet()
	}
}

// MARK: - FamilyTableViewDelegate
extension FamilyTableViewController: FamilyTableViewDelegate {
	
	func tableViewReloadData() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
	
	func setBarButton() {
		navigationItem.rightBarButtonItem = editButtonItem
	}
}
