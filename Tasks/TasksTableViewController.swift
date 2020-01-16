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
	var selectedIndexs: [IndexPath: Bool] = [:]
	
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
		tableView.backgroundColor = GeneralColors.globalColor
		tableView.separatorStyle = .none
		tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: String(describing: TaskTableViewCell.self))
		
		let addTaskBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTaskButtonPressed))
		navigationItem.rightBarButtonItem = addTaskBarButton
	}
	
	private func configureSubviews() {
		//view.addSubview
		//constraints
	}
	
	private func cellIsSelected(indexPath: IndexPath) -> Bool {
		if let number = selectedIndexs[indexPath] {
			return number
		} else {
			return false
		}
	}
	
	
	@objc func addTaskButtonPressed() {
		
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter?.dataSource.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskTableViewCell.self), for: indexPath) as! TaskTableViewCell
		cell.configure(task: presenter?.dataSource[indexPath.row])
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if self.cellIsSelected(indexPath: indexPath) {
        return UIScreen.main.bounds.size.width//height - ((navigationController?.navigationBar.frame.height ?? 0) + UIApplication.shared.statusBarFrame.height) - (tabBarController?.tabBar.frame.height ?? 0)
    } else {
        return 120
    }
//		return 120
	}
	
//	override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//		
//		let translationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 400, 0)
//		cell.layer.transform = translationTransform
//		
//		UIView.animate(withDuration: 0.2, delay: 0.2, options: .curveEaseInOut, animations: {
//			cell.layer.transform = CATransform3DIdentity })
//	}
	
	
//	override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//		if let cell = tableView.cellForRow(at: indexPath) as? TaskTableViewCell {
//					cell.cellDidTap()
//		//			cell.helperBackgroundView.frame.size.height = 400
//				}
//	}
//	
	
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		tableView.deselectRow(at: indexPath, animated: true)
		
		let isSelected = !self.cellIsSelected(indexPath: indexPath)
		selectedIndexs[indexPath] = isSelected
		
		tableView.performBatchUpdates(nil, completion: nil)
	
		if let cell = tableView.cellForRow(at: indexPath) as? TaskTableViewCell {
//			cell.rotateContent()
//			cell.rotateHeight = UIScreen.main.bounds.size.height - ((navigationController?.navigationBar.frame.height ?? 0) + UIApplication.shared.statusBarFrame.height) - (tabBarController?.tabBar.frame.height ?? 0)
			cell.cellDidTap()
				}
	}
	
	
	//		override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	//			let frame = CGRect(x: 0, y: 0, width: (navigationController?.navigationBar.frame.width)!, height: (navigationController?.navigationBar.frame.height)! + 20)
	//			let backgroundView = UIView(frame: frame)
	//			backgroundView.backgroundColor = UIColor(red:0.15, green:0.50, blue:0.01, alpha:1.0)
	//			navigationController?.navigationBar.setBackgroundImage(backgroundView.asImage(), for: .default)
	//		}
}

// MARK: - TasksViewDelegate
extension TasksTableViewController: TasksTableViewDelegate {
	
}
