//
//  SettingsViewController.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/26/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

final class SettingsViewController: UITableViewController {
	
	private var presenter: SettingsPresenterDelegate?
	
	
	init() {
		if #available(iOS 13.0, *) {
			super.init(style: .insetGrouped)
		} else {
			super.init(style: .grouped)
		}
		presenter = SettingsPresenter(view: self)
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
//		tableView.backgroundColor = .yellow
//		tableView.separatorColor = GeneralColors.globalColor
//		tableView.keyboardDismissMode = .interactive
//		tableView.tableHeaderView?.backgroundColor = .cyan
		tableView.register(SettingsUserProfileTableViewCell.self, forCellReuseIdentifier: String(describing: SettingsUserProfileTableViewCell.self))
		tableView.register(SettingsFamilyTableViewCell.self, forCellReuseIdentifier: String(describing: SettingsFamilyTableViewCell.self))
		tableView.register(SettingsCoinsTableViewCell.self, forCellReuseIdentifier: String(describing: SettingsCoinsTableViewCell.self))
	}
	
	private func configureSubviews() {
		//view.addSubview
		//constraints
	}
	
//	private func showAddUserDataController() {
//		let destination = AddUserDataTableViewController(user: presenter?.currentUser)
//		navigationController?.show(destination, sender: self)
//	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return presenter?.dataSource.count ?? 3
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter?.dataSource[section].count ?? 1
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let presenter = presenter else { return UITableViewCell()}
		let section = presenter.dataSource[indexPath.section][indexPath.row]
		switch section {
		case .userProfile:
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsUserProfileTableViewCell.self), for: indexPath) as! SettingsUserProfileTableViewCell
			cell.configure(user: presenter.currentUser)
			return cell
		case .family:
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsFamilyTableViewCell.self), for: indexPath) as! SettingsFamilyTableViewCell
//			cell.configure(user: presenter.currentUser)
			return cell
		case .mCoins:
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsCoinsTableViewCell.self), for: indexPath) as! SettingsCoinsTableViewCell
//			cell.configure(user: presenter.currentUser)
			return cell
		}
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return indexPath.section == 0 ? 120 : 44
	}
	
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		return nil
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section == 0 {
			return "Profile"
		}
		if section == 1 {
			return "Family"
		}
		return nil
	}
	
	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 30//section == 2 ? 0 : 16
	}
	
	override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return nil
	}
	
	override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 0
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let presenter = presenter else { return }
		let section = presenter.dataSource[indexPath.section][indexPath.row]
		switch section {
		case .userProfile:
			let destination = AddUserDataTableViewController(user: presenter.currentUser)
			navigationController?.show(destination, sender: self)
		case .family:
			if presenter.currentUser?.familyID != nil {
			let destination = FamilyTableViewController(currentUser: presenter.currentUser)
			navigationController?.show(destination, sender: self)
			} else {
				showActionSheet()
			}
		case .mCoins:
			print("coins")
		}
	}
	
	private func showActionSheet() {
		let alert = UIAlertController(title: "Do you want to create a new family or join an existing one?", message: nil, preferredStyle: .actionSheet)
		let createAction = UIAlertAction(title: "Create", style: .default) { (action) in
			print("Create")
		}
		let joinAction = UIAlertAction(title: "Join", style: .default) { [weak self] (action) in
			print("Join")
			let destination = JoinFamilyTableViewController(currentUser: self?.presenter?.currentUser)
//			self?.present(destination, animated: true, completion: nil)
			self?.navigationController?.show(destination, sender: self)
		}
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		alert.addAction(createAction)
		alert.addAction(joinAction)
		present(alert, animated: true, completion: nil)
	}
}

// MARK: - SettingsViewDelegate
extension SettingsViewController: SettingsViewDelegate {
	
	func tableViewReloadData() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
}
