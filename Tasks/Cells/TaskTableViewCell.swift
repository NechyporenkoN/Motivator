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
		imageView.image = UIImage(named: "lol")
		imageView.layer.cornerRadius = 20
		imageView.layer.borderWidth = 1
		imageView.layer.borderColor = GeneralColors.globalColor.cgColor
		imageView.layer.masksToBounds = true
		
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
	
		return stack
	}()
	
	private let starStackView: UIStackView = {
		let stack = UIStackView()
		stack.axis = .vertical

		return stack
	}()
	
	private let priorityStackView: UIStackView = {
		let stack = UIStackView()
		stack.axis = .vertical
		
		return stack
	}()
	
	private let generalStackView: UIStackView = {
		let stack = UIStackView()
		stack.axis = .horizontal
		stack.distribution = .fillEqually

		return stack
	}()
	
	private let typeLabel: UILabel = {
		let typeLabel = UILabel()
		typeLabel.translatesAutoresizingMaskIntoConstraints = false
		typeLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
		typeLabel.textAlignment = .center
		
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
		textView.isScrollEnabled = false
		textView.text = "Angry Birds – популярная мобильная игра, завоевавшая миллионы поклонников во всем мире. Все прекрасно знают правила, но никто даже не подозревает, с чего началось противостояние птичек и свинок. Также мало кто знает о некоторых секретах главных персонажей игры... С самого детства Рэд был настоящей «белой вороной» и был вынужден терпеть постоянные насмешки и издевательства со стороны своих сверстников. Теперь он вырос, но его жизнь совершенно не изменилась. За долгое время у него скопилось множество обиды и злости, что привело к тому, что он больше не мог удерживать в себе гнев. Это еще больше отдалило его от других и все старались избегать общения с ним. Больше всего Рэд хочет изменить свою жизнь и однажды у него появляется такая возможность... Смотрите онлайн фильм «Энгри Бердс в кино / Angry Birds в кино» в хорошем HD качестве на нашем сайте, бесплатно и без регистрации."
		return textView
	}()
	
	private var isRotate = false
	private var height: CGFloat = 120
	private let width: CGFloat = UIScreen.main.bounds.size.width
	private var helperBackgroundView = UIView()
	private var helperContentView = UIView()
//	private var helperAvatarView = UIView()
	private var firstVerticalView = UIView()
	private var secondVerticalView = UIView()
	private var firstHorizontalView = UIView()
	
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
		}
		else if task.status == StatusTask.awaiting.rawValue {
			typeLabel.text = "Awaiting"
			typeLabel.textColor = GeneralColors.lightOrangeCellColor
			helperBackgroundView.backgroundColor = GeneralColors.orangeTextColor
		}
		else if task.status == StatusTask.ready.rawValue {
			typeLabel.text = "Ready"
			typeLabel.textColor = GeneralColors.lightPurpleCellColor
			helperBackgroundView.backgroundColor = GeneralColors.purpleTextColor
		}
		else if task.status == StatusTask.unfulfilled.rawValue {
			typeLabel.text = "Unfulfilled"
			typeLabel.textColor = GeneralColors.lightRedCellColor
			helperBackgroundView.backgroundColor = GeneralColors.redTextColor
		}
	}
	
	private func configureView() {
		
		selectionStyle = .none
		accessoryType = .none
		backgroundColor = .clear
		
		firstVerticalView.backgroundColor = GeneralColors.globalColor
		secondVerticalView.backgroundColor = GeneralColors.globalColor
		
		timeStackView.addArrangedSubview(timeImageView)
		timeStackView.addArrangedSubview(timeLabel)
		
		starStackView.addArrangedSubview(starImageView)
		starStackView.addArrangedSubview(starLabel)
		
		priorityStackView.addArrangedSubview(priorityImageView)
		priorityStackView.addArrangedSubview(priorityLabel)
		
		generalStackView.addArrangedSubview(starStackView)
		generalStackView.addArrangedSubview(timeStackView)
		generalStackView.addArrangedSubview(priorityStackView)
		
		helperBackgroundView.frame = CGRect(x: 10, y: 6, width: width - 20, height: height - 6)
		helperBackgroundView.roundCorners(corners: [.bottomLeft, . topRight], size: 35)
		
		contentView.addSubview(helperBackgroundView)
		
		helperContentView.frame = CGRect(x: 36, y: 7, width: width - 48, height: height - 8)
		helperContentView.roundCorners(corners: [.bottomLeft, . topRight], size: 35)
		contentView.addSubview(helperContentView)
		
//		helperAvatarView.frame = CGRect(x: 8, y: 8, width: height - 40, height: height - 40)
//		helperAvatarView.layer.masksToBounds = true
//		helperAvatarView.layer.cornerRadius = 20
		avatarImageView.alpha = 0
		helperContentView.addSubview(avatarImageView)
		
		descriptionTextView.frame = CGRect(x: 40, y: 106, width: width - 40, height: height + 20)
		descriptionTextView.backgroundColor = .clear
		descriptionTextView.alpha = 0
		helperContentView.addSubview(descriptionTextView)
		
		taskNameLabel.frame = CGRect(x: 10, y: 6, width: helperContentView.frame.width - 20, height: 20)
		helperContentView.addSubview(taskNameLabel)
		
		avatarImageView.frame = CGRect(x: 8, y: 8, width: height - 40, height: height - 40)
//		avatarImageView.backgroundColor = .white
//		avatarImageView.roundCorners(corners: [.bottomLeft, .topRight], size: 20)
		
//		helperAvatarView.addSubview(avatarImageView)
		
		userNameLabel.alpha = 0
		helperContentView.addSubview(userNameLabel)
		
		generalStackView.frame = CGRect(x: 0, y: taskNameLabel.frame.height + 16, width: helperContentView.frame.width, height: 70)
		helperContentView.addSubview(generalStackView)
		
		firstVerticalView.frame = CGRect(x: generalStackView.frame.width/3, y: 4, width: 1, height: generalStackView.frame.height - 30)
		secondVerticalView.frame = CGRect(x: (generalStackView.frame.width/3) * 2, y: 4, width: 1, height: generalStackView.frame.height - 30)
		generalStackView.addSubview(firstVerticalView)
		generalStackView.addSubview(secondVerticalView)
		
		helperBackgroundView.addSubview(typeLabel)
//		helperAvatarView.backgroundColor = GeneralColors.globalColor
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
			userNameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
			userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 50),
		])
	}
	
	private func setNormalFrameViews() {
		
		avatarImageView.alpha = 0
		userNameLabel.alpha = 0
		descriptionTextView.alpha = 0
		height = 120
		helperBackgroundView.frame.size.height = height - 6
		helperBackgroundView.frame.size.width = width - 20
		helperBackgroundView.frame.origin.y = 6
		helperBackgroundView.frame.origin.x = 10
		
		helperContentView.frame.size.height = height - 8
		helperContentView.frame.size.width = width - 48
		helperContentView.frame.origin.x = 36
		helperContentView.frame.origin.y = 7
		helperContentView.roundCorners(corners: [.bottomLeft, .topRight], size: 35)
		helperBackgroundView.roundCorners(corners: [.bottomLeft, .topRight], size: 35)

		avatarImageView.frame.origin.x = 8
		avatarImageView.frame.origin.y = 8
		
		taskNameLabel.frame = CGRect(x: 10, y: 6, width: helperContentView.frame.width - 20, height: 20)
		generalStackView.frame = CGRect(x: 0, y: taskNameLabel.frame.height + 16, width: helperContentView.frame.width, height: 70)
		firstVerticalView.frame = CGRect(x: generalStackView.frame.width/3, y: 4, width: 1, height: generalStackView.frame.height - 30)
		secondVerticalView.frame = CGRect(x: (generalStackView.frame.width/3) * 2, y: 4, width: 1, height: generalStackView.frame.height - 30)
	}
	
	private func setRotateFrameViews() {
	
	avatarImageView.frame.origin.x = 6
	avatarImageView.frame.origin.y = 260
	avatarImageView.alpha = 1
	userNameLabel.alpha = 1
	descriptionTextView.alpha = 1
	helperBackgroundView.frame.size.height = width - 20
	helperBackgroundView.frame.size.width = height - 6
	helperBackgroundView.frame.origin.y = 13
	helperBackgroundView.frame.origin.x = 2
	helperBackgroundView.roundCorners(corners: [.topLeft, .bottomRight], size: 35)
	helperContentView.frame.size.height = width - 23
	helperContentView.frame.size.width = height - 36
	helperContentView.frame.origin.x = 17
	helperContentView.frame.origin.y = 28
	helperContentView.roundCorners(corners: [.topLeft, .bottomRight], size: 35)
	generalStackView.frame.origin.x = -50
	generalStackView.frame.origin.y = 90
	generalStackView.frame.size.width = width/1.5
	taskNameLabel.frame.origin.y = 160
	taskNameLabel.frame.origin.x = -140
	firstVerticalView.frame = CGRect(x: generalStackView.frame.width/3, y: 4, width: 1, height: generalStackView.frame.height - 36)
	secondVerticalView.frame = CGRect(x: (generalStackView.frame.width/3) * 2, y: 4, width: 1, height: generalStackView.frame.height - 36)
	}
	
	func cellDidTap() {
		
		helperBackgroundView.layer.add(bounceAnimation, forKey: nil)
		helperContentView.layer.add(bounceAnimation, forKey: nil)
		
		if !self.isRotate {
			
			UIView.animate(withDuration: 0.2) {
				self.height = self.frame.height
				self.setRotateFrameViews()
				self.rotateContent()
				self.isRotate = true
			}
		} else {
			
			UIView.animate(withDuration: 0.2) {
				self.restoreContent()
				self.setNormalFrameViews()
				self.isRotate = false
			}
		}
	}
	
	private func restoreContent() {
		
		helperBackgroundView.transform = .identity
		helperContentView.transform = .identity
		avatarImageView.transform = .identity
		generalStackView.transform = .identity
		taskNameLabel.transform = .identity
		descriptionTextView.transform = .identity
	}
	
	
	private func rotateContent() {
		
		helperBackgroundView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / -2)
		helperContentView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / -2)
		avatarImageView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
		generalStackView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
		taskNameLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
		userNameLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
		descriptionTextView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		typeLabel.text = nil
		typeLabel.textColor = nil
		helperBackgroundView.backgroundColor = nil
		helperContentView.backgroundColor = GeneralColors.navigationBlueColor
//		helperAvatarView.backgroundColor = GeneralColors.globalColor
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()

	}
}
