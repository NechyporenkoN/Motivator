//
//  JoinFamilyTableViewController.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 03.01.2020.
//  Copyright © 2020 Nikita Nechyporenko. All rights reserved.
//

import UIKit

final class JoinFamilyTableViewController: UITableViewController {
	
	private var presenter: JoinFamilyTablePresenterDelegate?
	
	init(currentUser: User?) {
		if #available(iOS 13.0, *) {
//			super.init(style: .insetGrouped)
						super.init(style: .grouped)
		} else {
			super.init(style: .grouped)
		}
		
		presenter = JoinFamilyTablePresenter(view: self, currentUser: currentUser)
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
		navigationItem.title = "Join"
		tableView.separatorStyle = .none
		tableView.register(JoinFamilyIDTableViewCell.self, forCellReuseIdentifier: String(describing: JoinFamilyIDTableViewCell.self))
		tableView.register(JoinButtonTableViewCell.self, forCellReuseIdentifier: String(describing: JoinButtonTableViewCell.self))
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
		if indexPath.section == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: JoinFamilyIDTableViewCell.self), for: indexPath) as! JoinFamilyIDTableViewCell
			return cell
		}
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: JoinButtonTableViewCell.self), for: indexPath) as! JoinButtonTableViewCell
		cell.delegate = self
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return indexPath.section == 0 ? 80 : 40
	}
	
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		return nil
	}
	
	override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return nil
	}
	
	override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 0
	}
	
	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return section == 0 ? 80 : 30
	}
}

// MARK: - JoinFamilyTableViewDelegate
extension JoinFamilyTableViewController: JoinFamilyTableViewDelegate {
	
	func familyIdDidRequest() -> String? {
		
		guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? JoinFamilyIDTableViewCell else {
			return nil
		}
		return cell.familyIDRequest()
	}
	
//	func popToViewController() {
//		navigationController?.popViewController(animated: true)
//	}
	
	func showFamilyViewController() {
//		self.dismiss(animated: true) {
//			if self.presenter?.currentUser?.familyID != nil {
//				let destination = FamilyTableViewController(currentUser: self.presenter?.currentUser)
//				self.navigationController?.show(destination, sender: self)
//				}
		}
//		if presenter?.currentUser?.familyID != nil {
//		let destination = FamilyTableViewController(currentUser: presenter?.currentUser)
//		navigationController?.show(destination, sender: self)
//	}
//}
	
	func popToViewController() {
		navigationController?.popViewController(animated: true)
	}
}

extension JoinFamilyTableViewController: JoinButtonTableViewCellDelegate {

	func joinButtonDidTap() {
		presenter?.joinToFamily(familyID: familyIdDidRequest())
		
//		print(familyIdDidRequest())
//		print("tap")
	}
	
	
}
