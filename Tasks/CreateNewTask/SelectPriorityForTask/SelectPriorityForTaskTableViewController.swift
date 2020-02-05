//
//  SelectPriorityForTaskTableViewController.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 04.02.2020.
//  Copyright © 2020 Nikita Nechyporenko. All rights reserved.
//

import UIKit


final class SelectPriorityForTaskTableViewController: UITableViewController {

	private var presenter: SelectPriorityForTaskTablePresenterDelegate?
	private var previousController: CreateNewTaskTableViewController?
	
	init(controller: CreateNewTaskTableViewController?) {
		previousController = controller
		super.init(style: .plain)
		presenter = SelectPriorityForTaskTablePresenter(view: self)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		configureView()
	}

	private func configureView() {

		navigationItem.title = "Select Priority"
		tableView.backgroundColor = .black
		tableView.separatorColor = .black
		tableView.contentInset = UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0)
		tableView.register(SelectPriorityTableViewCell.self, forCellReuseIdentifier: String(describing: SelectPriorityTableViewCell.self))
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		presenter?.priorityTitles.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SelectPriorityTableViewCell.self), for: indexPath) as! SelectPriorityTableViewCell
		cell.configure(priority: presenter?.priorityTitles[indexPath.row])
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 50
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		previousController?.priority = presenter?.priorityTitles[indexPath.row]
		navigationController?.popViewController(animated: true)
	}
}

// MARK: - SelectPriorityForTaskTableViewDelegate
extension SelectPriorityForTaskTableViewController: SelectPriorityForTaskTableViewDelegate {

}
