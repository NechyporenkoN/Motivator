//
//  CreateUserProfileTableViewController.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 11/27/19.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import UIKit
//import ImagePicker

final class CreateUserProfileTableViewController: UITableViewController {
	
	private var presenter: CreateUserProfileTablePresenterDelegate?
	var avatarImage: UIImage?
	
	init() {
		super.init(style: .grouped)
		presenter = CreateUserProfileTablePresenter(view: self)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//		SelectFamilyRoleTableViewController().delegate = self
		
		configureView()
		configureSubviews()
	}
	
	private func configureView() {
		
		navigationItem.title = "Create profile"
		
		let nextButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextButtonPressed))
		navigationItem.rightBarButtonItem = nextButton
		navigationItem.hidesBackButton = true
		//		navigationController?.navigationBar.backgroundColor = tableView.backgroundColor
		tableView.keyboardDismissMode = .interactive
		tableView.register(AddingUserDataTableViewCell.self, forCellReuseIdentifier: String(describing: AddingUserDataTableViewCell.self))
		tableView.register(FamilyRoleTableViewCell.self, forCellReuseIdentifier: String(describing: FamilyRoleTableViewCell.self))
		
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
			let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AddingUserDataTableViewCell.self), for: indexPath) as! AddingUserDataTableViewCell
			cell.delegate = self
			cell.configure(image: avatarImage)
			return cell
		}
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FamilyRoleTableViewCell.self), for: indexPath) as! FamilyRoleTableViewCell
		cell.configure(role: presenter?.familyRole)
		return cell
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return indexPath.section == 0 ? 120 : 44
	}
	
	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		return nil
	}
	
	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 16
	}
	
	override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		return nil
	}
	
	override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 0
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if indexPath.section == 1 {
			let destination = SelectFamilyRoleTableViewController()
//			destination.delegate = self
			navigationController?.show(destination, sender: self)
		}
	}
	
	@objc func nextButtonPressed() {
		guard presenter?.familyRole != nil else { return }
		presenter?.createUsers()
	}
}


// MARK: - CreateUserProfileTableViewDelegate
extension CreateUserProfileTableViewController: CreateUserProfileTableViewDelegate {
	
	func setAndShowGeneralController() {
		let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
		appDel.setGeneralRootViewController()
		let destination = GeneralTabBarController()
		navigationController?.show(destination, sender: self)
	}
	
	func reloadTableView() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
}

extension CreateUserProfileTableViewController: SelectFamilyRoleDelegate {
	
	func selectedRole(role: FamilyRoleRow) {
		presenter?.familyRole = role
		print(" l o l o l o ", role.rawValue)
		reloadTableView()
	}
}

extension CreateUserProfileTableViewController: AddPhotoButtonDelegate{
	
	func addPhotoButtonDidTap() {
		showAlert()
	}
}

extension CreateUserProfileTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	private func showAlert() {
		
		let alert = UIAlertController(title: nil , message: nil, preferredStyle: .actionSheet)
		
		alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { [weak self] (action) in
			self?.showCamera() }))
		
		alert.addAction(UIAlertAction(title: "Photo library", style: .default, handler: { [ weak self] (action) in
						self?.showPhotoLibrary() }))
		
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		present(alert, animated: true, completion: nil)
	}
	
	func showPhotoLibrary() {
		if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
			let imagePickerController = UIImagePickerController()
			imagePickerController.delegate = self
			imagePickerController.sourceType = .photoLibrary
			imagePickerController.allowsEditing = true
			present(imagePickerController, animated: true, completion: nil)
		}
	}
	
	func showCamera() {
		if UIImagePickerController.isSourceTypeAvailable(.camera) {
			let imagePickerController = UIImagePickerController()
			imagePickerController.delegate = self
			imagePickerController.sourceType = .camera
			imagePickerController.allowsEditing = true
			present(imagePickerController, animated: true, completion: nil)
		}
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
	
			if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
	//			presenter?.avatarRepresentation = MediaRepresentation(image)
				avatarImage = image
			}
	
			tableView.reloadSections([0], with: .automatic)
			dismiss(animated: true, completion: nil)
		}

}

//
//
//	func showPhotoLibrary() {
//		guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
////		checkPHStatus(controller: self) { [weak self] (state) in
//			guard let self = self, state else { return }
//			let imagePickerController = UIImagePickerController()
//			imagePickerController.delegate = self
//			imagePickerController.sourceType = .photoLibrary
//			imagePickerController.allowsEditing = true
//			self.present(imagePickerController, animated: true, completion: nil)
////		}
//	}
//
//	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//
//		dismiss(animated: true, completion: nil)
//	}
//
//

//}
