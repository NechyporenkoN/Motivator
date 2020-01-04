//
//  CreateFamilyTableViewController.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 04.01.2020.
//  Copyright © 2020 Nikita Nechyporenko. All rights reserved.
//

import UIKit


final class CreateFamilyTableViewController: UITableViewController {
	
	private var presenter: CreateFamilyTablePresenterDelegate?
	
	init(currentUser: User?) {
		if #available(iOS 13.0, *) {
			//			super.init(style: .insetGrouped)
			super.init(style: .grouped)
		} else {
			super.init(style: .grouped)
		}
		
		presenter = CreateFamilyTablePresenter(view: self)
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
		navigationItem.title = "Create family"
	}
	
	private func configureSubviews() {
		//view.addSubview
		//constraints
	}
}

// MARK: - CreateFamilyTableViewDelegate
extension CreateFamilyTableViewController: CreateFamilyTableViewDelegate {
	
}
