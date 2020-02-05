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
		imageView.layer.borderColor = UIColor.lightGray.cgColor//GeneralColors.globalColor.cgColor
		imageView.layer.masksToBounds = true
		
		return imageView
	}()
	
	private let timeImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = UIImage(named: "Clock")
		imageView.contentMode = .scaleAspectFit
		imageView.tintColor = .lightGray
		return imageView
	}()
	
	private let timeLabel: UILabel = {
		let label = UILabel()
		label.text = "1d 5h 30m"
		label.textAlignment = .center
		label.textColor = .lightGray//GeneralColors.globalColor
		return label
	}()
	
	private let starImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = UIImage(named: "Star")
		imageView.contentMode = .scaleAspectFit
		imageView.tintColor = .lightGray
		return imageView
	}()
	
	private let starLabel: UILabel = {
		let label = UILabel()
		label.text = "20"
		label.textAlignment = .center
		label.textColor = .lightGray//GeneralColors.globalColor
		return label
	}()
	
	private let priorityImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = UIImage(named: "Priority")
		imageView.contentMode = .scaleAspectFit
		imageView.tintColor = .lightGray
		return imageView
	}()
	
	private let priorityLabel: UILabel = {
		let label = UILabel()
		label.text = "high"
		label.textAlignment = .center
		label.textColor = .lightGray//GeneralColors.globalColor
		return label
	}()
	
	private let taskNameLabel: UILabel = {
		let label = UILabel()
		//		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .lightGray
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
		stack.tintColor = .lightGray
		
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
		label.textColor = .lightGray
		label.text = "Username"
		return label
	}()
	
	private let descriptionTextView: UITextView = {
		let textView = UITextView()
		textView.translatesAutoresizingMaskIntoConstraints = false
		textView.backgroundColor = .clear
		textView.textAlignment = .justified
		textView.isUserInteractionEnabled = false
		textView.text = "Angry Birds – популярная мобильная игра, завоевавшая миллионы поклонников во всем мире. Все прекрасно знают правила, но никто даже не подозревает, с чего началось противостояние птичек и свинок. Также мало кто знает о некоторых секретах главных персонажей игры... С самого детства Рэд был настоящей «белой вороной» и был вынужден терпеть постоянные насмешки и издевательства со стороны своих сверстников. Теперь он вырос, но его жизнь совершенно не изменилась. За долгое время у него скопилось множество обиды и злости, что привело к тому, что он больше не мог удерживать в себе гнев. Это еще больше отдалило его от других и все старались избегать общения с ним. Больше всего Рэд хочет изменить свою жизнь и однажды у него появляется такая возможность... Смотрите онлайн фильм «Энгри Бердс в кино / Angry Birds в кино» в хорошем HD качестве на нашем сайте, бесплатно и без регистрации."
		textView.textColor = .lightGray
		textView.font = UIFont.systemFont(ofSize: 16)
		return textView
	}()
	
	private var isRotate = false
	private var height: CGFloat = 120
	private let width: CGFloat = UIScreen.main.bounds.size.width
	private var helperBackgroundView = UIView()
	private var helperContentView = UIView()
	private var firstVerticalView = UIView()
	private var secondVerticalView = UIView()
	private var firstHorizontalView = UIView()
	private var selectedCell = false
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configureView()
		setConstraints()
		
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(task: Task?, isSelected: Bool) {
		selectedCell = isSelected
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
		
		firstVerticalView.backgroundColor = .lightGray
		secondVerticalView.backgroundColor = .lightGray
		
		timeStackView.addArrangedSubview(timeImageView)
		timeStackView.addArrangedSubview(timeLabel)
		
		starStackView.addArrangedSubview(starImageView)
		starStackView.addArrangedSubview(starLabel)
		
		priorityStackView.addArrangedSubview(priorityImageView)
		priorityStackView.addArrangedSubview(priorityLabel)
		
		generalStackView.addArrangedSubview(starStackView)
		generalStackView.addArrangedSubview(timeStackView)
		generalStackView.addArrangedSubview(priorityStackView)
		
		helperBackgroundView.frame = CGRect(x: 0, y: 2, width: width, height: height - 2)
		helperBackgroundView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(helperBackgroundView)
		
		helperContentView.translatesAutoresizingMaskIntoConstraints = false
		helperContentView.backgroundColor = .darkGray
		helperBackgroundView.addSubview(helperContentView)
		
		avatarImageView.alpha = 0
		helperContentView.addSubview(avatarImageView)
		
		descriptionTextView.alpha = 0
		helperContentView.addSubview(descriptionTextView)
		
		avatarImageView.translatesAutoresizingMaskIntoConstraints = false
		userNameLabel.alpha = 0
		helperContentView.addSubview(userNameLabel)
		
		generalStackView.frame = CGRect(x: 0, y: 30, width: width - 30, height: 80)
		helperContentView.addSubview(generalStackView)
		taskNameLabel.frame = CGRect(x: 0, y: 2, width: width - 30, height: 20)
		helperContentView.addSubview(taskNameLabel)
		firstVerticalView.frame = CGRect(x: generalStackView.frame.width/3, y: 4, width: 1, height: generalStackView.frame.height - 30)
		secondVerticalView.frame = CGRect(x: (generalStackView.frame.width/3) * 2, y: 4, width: 1, height: generalStackView.frame.height - 30)
		generalStackView.addSubview(firstVerticalView)
		generalStackView.addSubview(secondVerticalView)
		
		helperBackgroundView.addSubview(typeLabel)
		
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
			
			helperContentView.topAnchor.constraint(equalTo: helperBackgroundView.topAnchor),
			helperContentView.leadingAnchor.constraint(equalTo: helperBackgroundView.leadingAnchor, constant: 30),
			helperContentView.trailingAnchor.constraint(equalTo: helperBackgroundView.trailingAnchor),
			helperContentView.bottomAnchor.constraint(equalTo: helperBackgroundView.bottomAnchor),
			
			helperBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor),
			helperBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			helperBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			helperBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			
			
			avatarImageView.heightAnchor.constraint(equalToConstant: 80),
			avatarImageView.widthAnchor.constraint(equalToConstant: 80),
			avatarImageView.bottomAnchor.constraint(equalTo: helperContentView.bottomAnchor, constant: -20),
			avatarImageView.leadingAnchor.constraint(equalTo: helperContentView.leadingAnchor, constant: 20),
			
			descriptionTextView.widthAnchor.constraint(equalToConstant: contentView.frame.width + 14),
			descriptionTextView.centerYAnchor.constraint(equalTo: helperContentView.centerYAnchor),
			descriptionTextView.heightAnchor.constraint(equalToConstant: height + 20),
			descriptionTextView.centerXAnchor.constraint(equalTo: helperContentView.centerXAnchor, constant: 30),
			//			descriptionTextView.bottomAnchor.constraint(equalTo: helperContentView.bottomAnchor, constant: -20),
			//			descriptionTextView.topAnchor.constraint(equalTo: helperContentView.topAnchor, constant: 20)
			
			
		])
	}
	
	private func setNormalFrameViews() {
		
		height = 120
		
		taskNameLabel.frame = CGRect(x: 10, y: 6, width: width - 20, height: 20)
		generalStackView.frame = CGRect(x: 0, y: 30, width: width - 30, height: 80)
		firstVerticalView.frame = CGRect(x: generalStackView.frame.width/3, y: 4, width: 1, height: generalStackView.frame.height - 30)
		secondVerticalView.frame = CGRect(x: (generalStackView.frame.width/3) * 2, y: 4, width: 1, height: generalStackView.frame.height - 30)
		taskNameLabel.frame = CGRect(x: 0, y: 2, width: width - 30, height: 20)
	}
	
	private func setRotateFrameViews() {
		
		//		avatarImageView.frame.origin.x = 6
		//		avatarImageView.frame.origin.y = 260
		
		generalStackView.frame.origin.x = -50
		generalStackView.frame.origin.y = 110
		generalStackView.frame.size.width = width/1.5
		taskNameLabel.frame.origin.y = 142
		taskNameLabel.frame.origin.x = -158
		firstVerticalView.frame = CGRect(x: generalStackView.frame.width/3, y: 4, width: 1, height: generalStackView.frame.height - 36)
		secondVerticalView.frame = CGRect(x: (generalStackView.frame.width/3) * 2, y: 4, width: 1, height: generalStackView.frame.height - 36)
		
		
	}
	
	func cellDidTap() {
		
		//		helperBackgroundView.layer.add(bounceAnimation, forKey: nil)
		//		helperContentView.layer.add(bounceAnimation, forKey: nil)
		contentView.layer.add(bounceAnimation, forKey: nil)
		if !self.isRotate {
			UIView.animate(withDuration: 0.2, animations: {
				self.height = self.frame.height
				self.setRotateFrameViews()
				self.rotateContent()
				self.isRotate = true
			}) { (state) in
				UIView.animate(withDuration: 0.3) {
					self.avatarImageView.alpha = 1
					self.userNameLabel.alpha = 1
					self.descriptionTextView.alpha = 1
				}
			}
		} else {
			UIView.animate(withDuration: 0.05, animations: {
				self.generalStackView.alpha = 0
				self.avatarImageView.alpha = 0
				self.userNameLabel.alpha = 0
				self.descriptionTextView.alpha = 0
			}) { (state) in
				UIView.animate(withDuration: 0.2) {
					self.restoreContent()
					self.setNormalFrameViews()
					self.isRotate = false
					self.generalStackView.alpha = 1
				}
			}
		}
	}
	
	private func restoreContent() {
		contentView.transform = .identity
		//		helperBackgroundView.transform = .identity
		//		helperContentView.transform = .identity
		avatarImageView.transform = .identity
		generalStackView.transform = .identity
		taskNameLabel.transform = .identity
		userNameLabel.transform = .identity
		descriptionTextView.transform = .identity
	}
	
	
	private func rotateContent() {
		contentView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / -2)
		//		helperBackgroundView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / -2)
		//		helperContentView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / -2)
		avatarImageView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
		generalStackView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
		taskNameLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
		userNameLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
		descriptionTextView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
			setNormalFrameViews()
			typeLabel.text = nil
			typeLabel.textColor = nil
			helperBackgroundView.backgroundColor = nil
			helperContentView.backgroundColor = .darkGray
			avatarImageView.alpha = 0
			userNameLabel.alpha = 0
			descriptionTextView.alpha = 0
			restoreContent()
			setNormalFrameViews()
		
	}
	

	override func layoutSubviews() {
		super.layoutSubviews()
//		print("  ololololololollololollol       lolo ol olo lo lo llo ol", width)
//		print("  G G G G G G G G G G G G ", contentView.frame.height)
		
		contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0))
	}
}
