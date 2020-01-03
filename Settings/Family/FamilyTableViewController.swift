//
//  FamilyTableViewController.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 20.12.2019.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

final class FamilyTableViewController: UITableViewController {
	
	private var presenter: FamilyTablePresenterDelegate?
	
	init(currentUser: User?) {
		if #available(iOS 13.0, *) {
			super.init(style: .insetGrouped)
		} else {
			super.init(style: .grouped)
		}
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
		
		tableView.register(FamilyMembersTableViewCell.self, forCellReuseIdentifier: String(describing: FamilyMembersTableViewCell.self))
		
		let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))//UIBarButtonItem(image: UIImage(named: "Plus"), style: .plain, target: self, action: #selector(addButtonPressed))
		navigationItem.rightBarButtonItem = addButton
	}
	
	private func showActionSheet() {
		
		let alert = UIAlertController(title: "Who do you want to invite?", message: nil, preferredStyle: .actionSheet)
		
		let message = "Hey, invite you to join our family \nFamily ID: "
		let textToShare = [ message ]
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
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FamilyMembersTableViewCell.self), for: indexPath) as! FamilyMembersTableViewCell
		cell.configure(dataSource: indexPath.section == 0 ? presenter?.parentsDataSource as! [User] : presenter?.childsDataSource as! [User])
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 150
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return section == 0 ? "Parents" : "Childs"
	}
	
	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 30
	}
	
	override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return nil
	}
	
	override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 0
	}
	
	
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
}
