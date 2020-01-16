//
//  TaskTableViewCell.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 09.01.2020.
//  Copyright © 2020 Nikita Nechyporenko. All rights reserved.
//

import UIKit

final class TaskTableViewCell: UITableViewCell {
	
	private let bounceAnimation: CAKeyframeAnimation = {
		let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
		bounceAnimation.values = [1.0, 0.9, 1.04, 1.02, 1.0]
		bounceAnimation.duration = TimeInterval(0.3)
		bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
		
		return bounceAnimation
	}()
	
	private let avatarImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "lol")//UIImage(named: "UserAvatarHolder")
		
		return imageView
	}()
	
	private let timeImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = UIImage(named: "Clock")
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	private let timeLabel: UILabel = {
		let label = UILabel()
		label.text = "1d 5h 30m"
		label.textAlignment = .center
		label.textColor = GeneralColors.globalColor
		return label
	}()
	
	private let starImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = UIImage(named: "Star")
		imageView.contentMode = .scaleAspectFit
		
		return imageView
	}()
	
	private let starLabel: UILabel = {
		let label = UILabel()
		label.text = "20"
		label.textAlignment = .center
		label.textColor = GeneralColors.globalColor
		return label
	}()
	
	private let priorityImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = UIImage(named: "Priority")
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	private let priorityLabel: UILabel = {
		let label = UILabel()
		label.text = "high"
		label.textAlignment = .center
		label.textColor = GeneralColors.globalColor
		return label
	}()
	
	//	private let taskNameTitleLabel: UILabel = {
	//		let label = UILabel()
	//		label.text = "Task name"
	//		label.font = UIFont.systemFont(ofSize: 12)
	////		label.textAlignment = .center
	//		return label
	//	}()
	
	private let taskNameLabel: UILabel = {
		let label = UILabel()
		label.textColor = GeneralColors.globalColor
		label.text = "Сlean the room"
		label.textAlignment = .center
		return label
	}()
	
	private let timeStackView: UIStackView = {
		let stack = UIStackView()
		stack.axis = .vertical
		stack.distribution = .fillProportionally
		
		//		stack.spacing = 2
		return stack
	}()
	
	private let starStackView: UIStackView = {
		let stack = UIStackView()
		stack.axis = .vertical
		//		stack.distribution = .fill
		//		stack.spacing = 2
		return stack
	}()
	
	private let priorityStackView: UIStackView = {
		let stack = UIStackView()
		stack.axis = .vertical
		//		stack.distribution = .equalSpacing
		//		stack.spacing = 2
		return stack
	}()
	
	private let generalStackView: UIStackView = {
		let stack = UIStackView()
		stack.axis = .horizontal
		stack.distribution = .fillEqually
		//		stack.spacing = 40
		return stack
	}()
	
	private let typeLabel: UILabel = {
		let typeLabel = UILabel()
		typeLabel.translatesAutoresizingMaskIntoConstraints = false
		typeLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
		typeLabel.textAlignment = .center
//				typeLabel.textColor = .white
		
		return typeLabel
	}()
	
	private let userNameLabel: UILabel = {
			let label = UILabel()
			label.translatesAutoresizingMaskIntoConstraints = false
			label.textAlignment = .center
			label.textColor = GeneralColors.globalColor
			label.text = "Username"
			return label
		}()
	
	private let descriptionTextView: UITextView = {
		let textView = UITextView()
		textView.textAlignment = .justified
		textView.isEditable = false
		textView.text = "Angry Birds – популярная мобильная игра, завоевавшая миллионы поклонников во всем мире. Все прекрасно знают правила, но никто даже не подозревает, с чего началось противостояние птичек и свинок. Также мало кто знает о некоторых секретах главных персонажей игры... С самого детства Рэд был настоящей «белой вороной» и был вынужден терпеть постоянные насмешки и издевательства со стороны своих сверстников. Теперь он вырос, но его жизнь совершенно не изменилась. За долгое время у него скопилось множество обиды и злости, что привело к тому, что он больше не мог удерживать в себе гнев. Это еще больше отдалило его от других и все старались избегать общения с ним. Больше всего Рэд хочет изменить свою жизнь и однажды у него появляется такая возможность... Смотрите онлайн фильм «Энгри Бердс в кино / Angry Birds в кино» в хорошем HD качестве на нашем сайте, бесплатно и без регистрации."
		return textView
	}()
	
	private var isRotate = false
	private var height: CGFloat = 120
	private let width: CGFloat = UIScreen.main.bounds.size.width
	private var helperBackgroundView = UIView()
	private var helperContentView = UIView()
	private var helperAvatarView = UIView()
	private var firstVerticalView = UIView()
	private var secondVerticalView = UIView()
	private var firstHorizontalView = UIView()
	//	private var typeLabel = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configureView()
		setConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(task: Task?) {
		guard let task = task else { return }
		if task.status == StatusTask.active.rawValue {
			typeLabel.text = "Active"
			typeLabel.textColor = GeneralColors.lightGreenCellColor
			helperBackgroundView.backgroundColor = GeneralColors.greenTextColor
			//			helperContentView.backgroundColor = GeneralColors.lightGreenCellColor
//			helperAvatarView.backgroundColor = GeneralColors.greenCellColor
		}
		else if task.status == StatusTask.awaiting.rawValue {
			typeLabel.text = "Awaiting"
			typeLabel.textColor = GeneralColors.lightOrangeCellColor
			helperBackgroundView.backgroundColor = GeneralColors.orangeTextColor
			//			helperContentView.backgroundColor = GeneralColors.lightOrangeCellColor
//			helperAvatarView.backgroundColor = GeneralColors.orangeCellColor
		}
		else if task.status == StatusTask.ready.rawValue {
			typeLabel.text = "Ready"
			typeLabel.textColor = GeneralColors.lightPurpleCellColor
			helperBackgroundView.backgroundColor = GeneralColors.purpleTextColor
			//			helperContentView.backgroundColor = GeneralColors.lightPurpleCellColor
//			helperAvatarView.backgroundColor = GeneralColors.purpleCellColor
		}
		else if task.status == StatusTask.unfulfilled.rawValue {
			typeLabel.text = "Unfulfilled"
			typeLabel.textColor = GeneralColors.lightRedCellColor
			helperBackgroundView.backgroundColor = GeneralColors.redTextColor
			//			helperContentView.backgroundColor = GeneralColors.lightRedCellColor
//			helperAvatarView.backgroundColor = GeneralColors.redCellColor
		}
	}
	
	private func configureView() {
		
		selectionStyle = .none
		accessoryType = .none
		backgroundColor = .clear
		
//		firstVerticalView.translatesAutoresizingMaskIntoConstraints = false//frame = CGRect(x: 0, y: 0, width: 1, height: 40)
//		secondVerticalView.translatesAutoresizingMaskIntoConstraints = false//frame = CGRect(x: 0, y: 0, width: 1, height: 40)
		
		firstVerticalView.backgroundColor = GeneralColors.globalColor
		secondVerticalView.backgroundColor = GeneralColors.globalColor
		
		
		
		timeStackView.addArrangedSubview(timeImageView)
		timeStackView.addArrangedSubview(timeLabel)
		
		starStackView.addArrangedSubview(starImageView)
		starStackView.addArrangedSubview(starLabel)
		
		priorityStackView.addArrangedSubview(priorityImageView)
		priorityStackView.addArrangedSubview(priorityLabel)
		
		generalStackView.addArrangedSubview(starStackView)
//		generalStackView.addArrangedSubview(firstVerticalView)
		generalStackView.addArrangedSubview(timeStackView)
//		generalStackView.addArrangedSubview(secondVerticalView)
		generalStackView.addArrangedSubview(priorityStackView)
		
		
		
		
		helperBackgroundView.frame = CGRect(x: 10, y: 6, width: width - 20, height: height - 6)
		helperBackgroundView.roundCorners(corners: [.bottomLeft, . topRight], size: 35)
		
		contentView.addSubview(helperBackgroundView)
		
		helperContentView.frame = CGRect(x: 36, y: 7, width: width - 48, height: height - 8)
		helperContentView.roundCorners(corners: [.bottomLeft, . topRight], size: 35)
		contentView.addSubview(helperContentView)
		
		helperAvatarView.frame = CGRect(x: 8, y: 8, width: height - 40, height: height - 40)
		helperAvatarView.roundCorners(corners: [.bottomLeft, .topRight], size: 20)
		helperAvatarView.alpha = 0
		helperContentView.addSubview(helperAvatarView)
		
		descriptionTextView.frame = CGRect(x: 40, y: 106, width: width - 40, height: height + 20)
		descriptionTextView.backgroundColor = .clear
		descriptionTextView.alpha = 0
		helperContentView.addSubview(descriptionTextView)
		
		taskNameLabel.frame = CGRect(x: 10, y: 6, width: helperContentView.frame.width - 20, height: 20)
		helperContentView.addSubview(taskNameLabel)
		
		avatarImageView.frame = CGRect(x: 1, y: 1, width: height - 42, height: height - 42)
		avatarImageView.backgroundColor = .white
		avatarImageView.roundCorners(corners: [.bottomLeft, .topRight], size: 20)
		
		helperAvatarView.addSubview(avatarImageView)
		
		userNameLabel.alpha = 0
		helperContentView.addSubview(userNameLabel)
		
		generalStackView.frame = CGRect(x: 0, y: taskNameLabel.frame.height + 16, width: helperContentView.frame.width, height: 70)//helperContentView.frame.height - (taskNameLabel.frame.height + 10))
		helperContentView.addSubview(generalStackView)
		
		firstVerticalView.frame = CGRect(x: generalStackView.frame.width/3, y: 4, width: 1, height: generalStackView.frame.height - 30)
		secondVerticalView.frame = CGRect(x: (generalStackView.frame.width/3) * 2, y: 4, width: 1, height: generalStackView.frame.height - 30)
		generalStackView.addSubview(firstVerticalView)
		generalStackView.addSubview(secondVerticalView)
		
		helperBackgroundView.addSubview(typeLabel)
		helperAvatarView.backgroundColor = GeneralColors.globalColor
		helperContentView.backgroundColor = GeneralColors.navigationBlueColor
		
	}
	
	
	
	private func setConstraints() {
		NSLayoutConstraint.activate([
			typeLabel.heightAnchor.constraint(equalToConstant: 20),
			typeLabel.widthAnchor.constraint(equalToConstant: height - 20),
			typeLabel.centerYAnchor.constraint(equalTo: helperBackgroundView.centerYAnchor),
			typeLabel.leftAnchor.constraint(equalTo: helperBackgroundView.leftAnchor, constant: -36),
			
			starImageView.heightAnchor.constraint(equalToConstant: 40),
			starImageView.widthAnchor.constraint(equalToConstant: 40),
			
			timeImageView.heightAnchor.constraint(equalToConstant: 40),
			timeImageView.widthAnchor.constraint(equalToConstant: 40),
			priorityImageView.heightAnchor.constraint(equalToConstant: 40),
			priorityImageView.widthAnchor.constraint(equalToConstant: 40),
			
			userNameLabel.heightAnchor.constraint(equalToConstant: 16),
			userNameLabel.centerYAnchor.constraint(equalTo: helperAvatarView.centerYAnchor),
			userNameLabel.leadingAnchor.constraint(equalTo: helperAvatarView.leadingAnchor, constant: 50),
			
			
//			secondVerticalView.heightAnchor.constraint(equalToConstant: 25),
//			secondVerticalView.widthAnchor.constraint(equalToConstant: 1)
			
			
			//			generalStackView.heightAnchor.constraint(equalToConstant: height/2 - 20),
			//			generalStackView.widthAnchor.constraint(equalToConstant: width/2),
			//			generalStackView.leadingAnchor.constraint(equalTo: helperAvatarView.trailingAnchor, constant: 10),
			//			generalStackView.topAnchor.constraint(equalTo: helperContentView.topAnchor, constant: 30)
		])
	}
	
	func cellDidTap() {
		
		
		helperBackgroundView.layer.add(bounceAnimation, forKey: nil)
		helperContentView.layer.add(bounceAnimation, forKey: nil)
		
		
		if !self.isRotate {
			UIView.animate(withDuration: 0.2) {
				self.height = self.frame.height
				
				//				self.helperAvatarView.isHidden = true
				self.helperAvatarView.frame.origin.x = 6
				self.helperAvatarView.frame.origin.y = 260
				self.helperAvatarView.alpha = 1
				self.userNameLabel.alpha = 1
				self.descriptionTextView.alpha = 1
				self.helperBackgroundView.frame.size.height = self.width - 20
				self.helperBackgroundView.frame.size.width = self.height - 6
				self.helperBackgroundView.frame.origin.y = 13
				self.helperBackgroundView.frame.origin.x = 2
				self.helperBackgroundView.roundCorners(corners: [.topLeft, .bottomRight], size: 35)
				//			self.helperContentView.isHidden = true
				self.helperContentView.frame.size.height = self.width - 23
				self.helperContentView.frame.size.width = self.height - 36
				//			self.typeLabel.isHidden = true
				self.helperContentView.frame.origin.x = 17
				self.helperContentView.frame.origin.y = 28
				self.helperContentView.roundCorners(corners: [.topLeft, .bottomRight], size: 35)
				self.generalStackView.frame.origin.x = -50
				self.generalStackView.frame.origin.y = 90
				self.generalStackView.frame.size.width = self.width/1.5
				
				self.taskNameLabel.frame.origin.y = 160
				self.taskNameLabel.frame.origin.x = -140
				
				
				self.firstVerticalView.frame = CGRect(x: self.generalStackView.frame.width/3, y: 4, width: 1, height: self.generalStackView.frame.height - 36)
				self.secondVerticalView.frame = CGRect(x: (self.generalStackView.frame.width/3) * 2, y: 4, width: 1, height: self.generalStackView.frame.height - 36)
				self.rotateContent()
				
				self.isRotate = true
			}
		} else {
			UIView.animate(withDuration: 0.2) {
				//				self.helperAvatarView.isHidden = true
				self.helperAvatarView.alpha = 0
				self.userNameLabel.alpha = 0
				self.descriptionTextView.alpha = 0
				self.height = 120
				self.helperBackgroundView.transform = .identity
				self.helperContentView.transform = .identity
				self.helperAvatarView.transform = .identity
				self.generalStackView.transform = .identity
				self.taskNameLabel.transform = .identity
				self.descriptionTextView.transform = .identity
				//				self.helperAvatarView.frame.origin.x = 8
				
				
				self.helperBackgroundView.frame.size.height = self.height - 6
				self.helperBackgroundView.frame.size.width = self.width - 20
				self.helperBackgroundView.frame.origin.y = 6
				self.helperBackgroundView.frame.origin.x = 10
				
				self.helperContentView.frame.size.height = self.height - 8
				self.helperContentView.frame.size.width = self.width - 48
				self.helperContentView.frame.origin.x = 36
				self.helperContentView.frame.origin.y = 7
				self.helperContentView.roundCorners(corners: [.bottomLeft, .topRight], size: 35)
				self.helperBackgroundView.roundCorners(corners: [.bottomLeft, .topRight], size: 35)
				
				self.helperAvatarView.frame.origin.x = 8
				self.helperAvatarView.frame.origin.y = 8
				
				self.taskNameLabel.frame = CGRect(x: 10, y: 6, width: self.helperContentView.frame.width - 20, height: 20)
				self.generalStackView.frame = CGRect(x: 0, y: self.taskNameLabel.frame.height + 16, width: self.helperContentView.frame.width, height: 70)// self.helperContentView.frame.height - (self.taskNameLabel.frame.height + 10))
				self.firstVerticalView.frame = CGRect(x: self.generalStackView.frame.width/3, y: 4, width: 1, height: self.generalStackView.frame.height - 30)
				self.secondVerticalView.frame = CGRect(x: (self.generalStackView.frame.width/3) * 2, y: 4, width: 1, height: self.generalStackView.frame.height - 30)
//				self.generalStackView.frame.size.height = self.helperContentView.frame.height - (self.taskNameLabel.frame.height + 10)
//				self.generalStackView.frame.size.width = self.helperContentView.frame.width
//				self.generalStackView.frame.origin.x = 0
//				self.generalStackView.frame.origin.y = self.taskNameLabel.frame.height + 16
				
				self.isRotate = false
			}
		}
	}
	
	
	
	func rotateContent() {
		
		helperBackgroundView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / -2)
		helperContentView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / -2)
		helperAvatarView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
		generalStackView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
		taskNameLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
		userNameLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
		descriptionTextView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		//					self.height = 120
		//
		//					self.helperBackgroundView.frame.size.height = self.height - 6
		//					self.helperBackgroundView.frame.size.width = self.width - 20
		//					self.helperBackgroundView.frame.origin.y = 6
		//					self.helperBackgroundView.frame.origin.x = 10
		//
		//					self.helperContentView.frame.size.height = self.height - 8
		//					self.helperContentView.frame.size.width = self.width - 48
		//					self.helperContentView.frame.origin.x = 36
		//					self.helperContentView.frame.origin.y = 7
		
		
		
		//		self.helperBackgroundView.transform = .identity
		//		self.helperContentView.transform = .identity
		
		
		//		helperBackgroundView.transform = CGAffineTransform.identity
		//		helperContentView.transform = CGAffineTransform.identity
		
		typeLabel.text = nil
		typeLabel.textColor = nil
		helperBackgroundView.backgroundColor = nil
		helperContentView.backgroundColor = GeneralColors.navigationBlueColor
		helperAvatarView.backgroundColor = GeneralColors.globalColor
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		
		//		if !self.isRotate {
		//
		//			self.height = self.frame.height
		//
		//			self.helperBackgroundView.frame.size.height = self.width - 20
		//			self.helperBackgroundView.frame.size.width = self.height - 6
		//			self.helperBackgroundView.frame.origin.y = 13
		//			self.helperBackgroundView.frame.origin.x = 2
		////			self.helperBackgroundView.roundCorners(corners: [.topLeft, .bottomRight], size: 35)
		//
		//			self.helperContentView.frame.size.height = self.width - 23
		//			self.helperContentView.frame.size.width = self.height - 36
		//			self.helperContentView.frame.origin.x = 17
		//			self.helperContentView.frame.origin.y = 28
		////			self.helperContentView.roundCorners(corners: [.topLeft, .bottomRight], size: 35)
		//
		//		} else {
		//
		//			self.height = 120
		//
		//			self.helperBackgroundView.frame.size.height = self.height - 6
		//			self.helperBackgroundView.frame.size.width = self.width - 20
		//			self.helperBackgroundView.frame.origin.y = 6
		//			self.helperBackgroundView.frame.origin.x = 10
		//
		//			self.helperContentView.frame.size.height = self.height - 8
		//			self.helperContentView.frame.size.width = self.width - 48
		//			self.helperContentView.frame.origin.x = 36
		//			self.helperContentView.frame.origin.y = 7
		//
		//		}
		//			self.helperContentView.roundCorners(corners: [.bottomLeft, .topRight], size: 35)
		//			self.helperBackgroundView.roundCorners(corners: [.bottomLeft, .topRight], size: 35)
		
		
		//		height = self.frame.height
		//		print(height)
		//		helperBackgroundView.frame.size.height = height - 6
		//
		//		helperBackgroundView.roundCorners(corners: [.bottomLeft, . topRight], size: 35)
		//
		//		helperContentView.frame.size.height = height - 8
		//		helperContentView.frame.size.width = width - 20
		//		helperContentView.frame.origin.x = 10
		//		helperContentView.roundCorners(corners: [.bottomLeft, . topRight], size: 35)
		
		//		helperBackgroundView.frame.size.height = 300// = UIView(frame: CGRect(x: 10, y: 6, width: width - 20, height: height - 6))
		//		helperContentView = UIView(frame: CGRect(x: 36, y: 7, width: width - 48, height: height - 8))
		//		helperView = UIView(frame: CGRect(x: 6, y: 6, width: self.frame.width - 12, height: self.frame.height - 12))
		//		helperView.roundCorners(corners: [.bottomLeft, . topRight], size: 35)
		//		helperView.backgroundColor = .green
	}
}
