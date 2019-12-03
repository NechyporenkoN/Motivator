//
//  TasksViewController.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/26/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit

/**
IMPORTANT:
IF YOU NEED UITableViewController or UICollectionViewController
Change the Class Name to NameTableViewController or NameCollectionViewController
Dont leave Your class name NameViewController
*/
final class TasksViewController: UIViewController {

	private var presenter: TasksPresenterDelegate?

	convenience init() {
		self.init(nibName: nil, bundle: nil)
		presenter = TasksPresenter(view: self)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		configureView()
		configureSubviews()
	}
	
	private func configureView() {
		view.backgroundColor = .white
	}

	private func configureSubviews() {
		//view.addSubview
		//constraints
	}
}

// MARK: - TasksViewDelegate
extension TasksViewController: TasksViewDelegate {

}
