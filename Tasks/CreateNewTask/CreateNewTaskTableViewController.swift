//
//  CreateNewTaskTableViewController.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 04.02.2020.
//  Copyright © 2020 Nikita Nechyporenko. All rights reserved.
//

import UIKit


final class CreateNewTaskTableViewController: UITableViewController {
	
	let datePicker: UIDatePicker = {
		let picker = UIDatePicker()
		picker.translatesAutoresizingMaskIntoConstraints = false
		picker.timeZone = NSTimeZone.local
		picker.locale = NSLocale.init(localeIdentifier: "ru_RU") as Locale
		picker.datePickerMode = .dateAndTime
		
		return picker
	}()
	
	private var presenter: CreateNewTaskPresenterDelegate?
	private var date: String?
	var priority: PriorityType? {
		didSet {
			tableView.reloadRows(at: [IndexPath(row: 3, section: 0)], with: .automatic)
		}
	}
	
	init() {
		super.init(style: .plain)
		presenter = CreateNewTaskPresenter(view: self)
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
		
		navigationItem.title = "Create New Task"
		
		tableView.keyboardDismissMode = .interactive
		tableView.backgroundColor = .black
		tableView.separatorColor = .black
		tableView.estimatedRowHeight = 50
		
		tableView.contentInset = UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0)
		tableView.register(TaskNameTableViewCell.self, forCellReuseIdentifier: String(describing: TaskNameTableViewCell.self))
		tableView.register(TaskDescriptionTableViewCell.self, forCellReuseIdentifier: String(describing: TaskDescriptionTableViewCell.self))
		tableView.register(TaskDeadlineTableViewCell.self, forCellReuseIdentifier: String(describing: TaskDeadlineTableViewCell.self))
		tableView.register(TaskPriorityTableViewCell.self, forCellReuseIdentifier: String(describing: TaskPriorityTableViewCell.self))
		
		let createButton = UIBarButtonItem(title: "Create", style: .done, target: self, action: #selector(createButtonPressed))
		navigationItem.rightBarButtonItem = createButton
	}
	
	//	func configureOkActon() {
	//		print(dateString != nil)
	//		okAction?.isEnabled = dateString != nil ? true : false
	//	}
	
	private func showAlertDatePicker() {
		datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
		datePicker.setValue(UIColor.lightGray, forKeyPath: "textColor")
		datePicker.setValue(false, forKeyPath: "highlightsToday")
		
		let alertView = UIAlertController(title: "Set the time to complete the task", message: "\n\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet);
		alertView.view.addSubview(datePicker)
		
		let subview = (alertView.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
		datePicker.backgroundColor = subview.backgroundColor//.clear
		alertView.view.backgroundColor = .clear//subview.backgroundColor
		subview.backgroundColor = .darkGray
		
		alertView.view.tintColor = .lightGray
		//		alertView.view.backgroundColor = .clear
		
		datePicker.topAnchor.constraint(equalTo: alertView.view.topAnchor, constant: 24).isActive = true
		datePicker.centerXAnchor.constraint(equalTo: alertView.view.centerXAnchor).isActive = true
		
		let okAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
			
			print("ok")
		}
		alertView.addAction(okAction)
		present(alertView, animated: true, completion: nil)
		
	}
	
	
	private func configureSubviews() {
		//view.addSubview
		//constraints
	}
	
	@objc func datePickerValueChanged(_ sender: UIDatePicker) {
		
		let dateFormatter: DateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"//"HH:mm:ss"
		
		date = dateFormatter.string(from: sender.date)
		print(date)
		tableView.reloadRows(at: [IndexPath(row: 2, section: 0)], with: .automatic)
		//		dateString = selectedDate.replacingOccurrences(of: "/", with: ".")
		//		dateLabel.text = selectedDate.replacingOccurrences(of: "/", with: " ")
		//		print("Selected value \(selectedDate)")
		//		print("value \(dateString)")
	}
	
	@objc func createButtonPressed() {
		navigationController?.popViewController(animated: true)
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 4
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.row == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskNameTableViewCell.self), for: indexPath) as! TaskNameTableViewCell
			return cell
		}
		if indexPath.row == 1 {
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskDescriptionTableViewCell.self), for: indexPath) as! TaskDescriptionTableViewCell
			cell.delegate = self
			return cell
		}
		if indexPath.row == 2 {
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskDeadlineTableViewCell.self), for: indexPath) as! TaskDeadlineTableViewCell
			cell.configure(date: date)
			return cell
		}
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskPriorityTableViewCell.self), for: indexPath) as! TaskPriorityTableViewCell
		cell.configure(priority: priority)
		return cell
	}
	
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row == 1 {
			return UITableView.automaticDimension
		}
		return 50
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath.row == 2 {
			showAlertDatePicker()
		}
		if indexPath.row == 3 {
			let destination = SelectPriorityForTaskTableViewController(controller: self)
			navigationController?.show(destination, sender: self)
		}
	}
}

// MARK: - CreateNewTaskViewDelegate
extension CreateNewTaskTableViewController: CreateNewTaskViewDelegate {
	
}

extension CreateNewTaskTableViewController: TaskDescriptionTableViewCellDelegate {
	func updateHeightOfRow(_ cell: UITableViewCell, _ textView: UITextView) {
		
		let size = textView.bounds.size
		let newSize = tableView.sizeThatFits(CGSize(width: size.width, height: CGFloat.greatestFiniteMagnitude))
		
		if size.height != newSize.height {
			UIView.performWithoutAnimation {
				self.tableView.performBatchUpdates(nil, completion: nil)
				
				if let thisIndexPath = self.tableView.indexPath(for: cell) {
					self.tableView.scrollToRow(at: thisIndexPath, at: .bottom, animated: false)
				}
			}
		}
	}}
