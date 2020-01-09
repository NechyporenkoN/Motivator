//
//  TasksViewController.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/26/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

final class TasksTableViewController: UITableViewController {
	
	private var presenter: TasksTablePresenterDelegate?
	
	init() {
		super.init(style: .plain)
		presenter = TasksTablePresenter(view: self)
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
//		view.backgroundColor = .clear
		tableView.separatorStyle = .none
		tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: String(describing: TaskTableViewCell.self))
		
		let addTaskBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTaskButtonPressed))
		navigationItem.rightBarButtonItem = addTaskBarButton
	}
	
	private func configureSubviews() {
		//view.addSubview
		//constraints
	}
	
	@objc func addTaskButtonPressed() {
		
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 13
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskTableViewCell.self), for: indexPath) as! TaskTableViewCell
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 132
	}
}

// MARK: - TasksViewDelegate
extension TasksTableViewController: TasksTableViewDelegate {
	
}
