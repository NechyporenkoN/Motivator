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
		super.init(style: .grouped)
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
		
		tableView.keyboardDismissMode = .interactive
		tableView.register(AddingUserDataTableViewCell.self, forCellReuseIdentifier: String(describing: AddingUserDataTableViewCell.self))
		tableView.register(SettingsUserProfileTableViewCell.self, forCellReuseIdentifier: String(describing: SettingsUserProfileTableViewCell.self))
		
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
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsUserProfileTableViewCell.self), for: indexPath) as! SettingsUserProfileTableViewCell
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return indexPath.section == 0 ? 120 : 44
	}
}

// MARK: - SettingsViewDelegate
extension SettingsViewController: SettingsViewDelegate {
	
}
