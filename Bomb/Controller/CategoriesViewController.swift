//
//  CategoriesViewController.swift
//  Bomb
//
//  Team №9 | Swift Marathon 8.0
//

import UIKit

class CategoriesViewController: UIViewController {
    
    private func checkSelectedCategories() {
            let selectedCategories = UserCategoryKeeper.shared.getSelectedCategories()
            let buttons = [firstButton, secondButton, thirdButton, fourthButton, fifthButton]

            buttons.forEach { button in
                guard let category = button.category, selectedCategories.contains(category) else {
                    return
                }

                button.isPressed = true
                button.layer.borderColor = UIColor().getButtonTextColor().cgColor
            }
        }
    
    private lazy var firstButton: UIButton = {
        let button = UIButton()
        button.category = .aboutDifferent
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        let image = UIImageView()
        image.image = UIImage(named: "image 1")
        button.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
        button.backgroundColor = UIColor().getButtonColor()
        button.setTitle("О Разном", for: .normal)
        button.titleLabel?.font = UIFont(name: "Dela Gothic One", size: 15)
        button.contentVerticalAlignment = .bottom
        button.setTitleColor(UIColor().getButtonTextColor(), for: .normal)
        button.drawShadow()
        button.layer.cornerRadius = 40
        button.layer.borderWidth = 4.0
        button.layer.borderColor = UIColor().getButtonColor().cgColor
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton()
        button.category = .sport
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        let image = UIImageView()
        image.image = UIImage(named: "image 2")
        button.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
        button.backgroundColor = UIColor().getButtonColor()
        button.setTitle("Спорт и Хобби", for: .normal)
        button.titleLabel?.font = UIFont(name: "Dela Gothic One", size: 15)
        button.contentVerticalAlignment = .bottom
        button.setTitleColor(UIColor().getButtonTextColor(), for: .normal)
        button.drawShadow()
        button.layer.cornerRadius = 40
        button.layer.borderWidth = 4.0
        button.layer.borderColor = UIColor().getButtonColor().cgColor
        return button
    }()
    
    private lazy var thirdButton: UIButton = {
        let button = UIButton()
        button.category = .adoutLife
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        let image = UIImageView()
        image.image = UIImage(named: "image 3")
        button.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
        button.backgroundColor = UIColor().getButtonColor()
        button.setTitle("Про Жизнь", for: .normal)
        button.titleLabel?.font = UIFont(name: "Dela Gothic One", size: 15)
        button.contentVerticalAlignment = .bottom
        button.setTitleColor(UIColor().getButtonTextColor(), for: .normal)
        button.drawShadow()
        button.layer.cornerRadius = 40
        button.layer.borderWidth = 4.0
        button.layer.borderColor = UIColor().getButtonColor().cgColor
        return button
    }()
    
    private lazy var fourthButton: UIButton = {
        let button = UIButton()
        button.category = .celebrities
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        let image = UIImageView()
        image.image = UIImage(named: "image 4")
        button.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
        button.backgroundColor = UIColor().getButtonColor()
        button.setTitle("Знаменитости", for: .normal)
        button.titleLabel?.font = UIFont(name: "Dela Gothic One", size: 15)
        button.contentVerticalAlignment = .bottom
        button.setTitleColor(UIColor().getButtonTextColor(), for: .normal)
        button.drawShadow()
        button.layer.cornerRadius = 40
        button.layer.borderWidth = 4.0
        button.layer.borderColor = UIColor().getButtonColor().cgColor
        return button
    }()
    
    private lazy var fifthButton: UIButton = {
        let button = UIButton()
        button.category = .artAndCinema
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        let image = UIImageView()
        image.image = UIImage(named: "image 5")
        button.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
        button.backgroundColor = UIColor().getButtonColor()
        button.setTitle("Искусство и Кино", for: .normal)
        button.titleLabel?.font = UIFont(name: "Dela Gothic One", size: 14)
        button.contentVerticalAlignment = .bottom
        button.setTitleColor(UIColor().getButtonTextColor(), for: .normal)
        button.drawShadow()
        button.layer.cornerRadius = 40
        button.layer.borderWidth = 4.0
        button.layer.borderColor = UIColor().getButtonColor().cgColor
        return button
    }()
    
    private lazy var sixthButton: UIButton = {
        let button = UIButton()
        button.category = .nature
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        let image = UIImageView()
        image.image = UIImage(named: "image 6")
        button.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
        button.backgroundColor = UIColor().getButtonColor()
        button.setTitle("Природа", for: .normal)
        button.titleLabel?.font = UIFont(name: "Dela Gothic One", size: 15)
        button.contentVerticalAlignment = .bottom
        button.setTitleColor(UIColor().getButtonTextColor(), for: .normal)
        button.drawShadow()
        button.layer.cornerRadius = 40
        button.layer.borderWidth = 4.0
        button.layer.borderColor = UIColor().getButtonColor().cgColor
        return button
    }()
    
    private lazy var firstHorStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        return stackView
    }()
    
    private lazy var secondHorStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        return stackView
    }()
    
    private lazy var thirdHorStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        return stackView
    }()
    
    private lazy var verStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 13
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkSelectedCategories()
        self.title = "Категории"
        navigationController?.addBackButton()
        navigationController?.setNavigationBarTitle(for: self)
        setBackground()
        setupViews()
        setConstraints()
    }
    
    func setupViews() {
        view.addSubview(verStack)
        verStack.addArrangedSubview(firstHorStack)
        verStack.addArrangedSubview(secondHorStack)
        verStack.addArrangedSubview(thirdHorStack)
        firstHorStack.addArrangedSubview(firstButton)
        firstHorStack.addArrangedSubview(secondButton)
        secondHorStack.addArrangedSubview(thirdButton)
        secondHorStack.addArrangedSubview(fourthButton)
        thirdHorStack.addArrangedSubview(fifthButton)
        thirdHorStack.addArrangedSubview(sixthButton)
    }
    
    func setConstraints() {
        verStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 52),
            verStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            verStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            verStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -99)
        ])
    }
    
    @objc func buttonTapped(sender: UIButton) {
        if sender.isPressed {
            sender.isPressed = false
            sender.layer.borderColor = UIColor().getButtonColor().cgColor
            UserCategoryKeeper.shared.removeCategory(sender.category!)
            print(UserCategoryKeeper.shared.getSelectedCategories())
        } else {
            sender.isPressed = true
            sender.layer.borderColor = UIColor().getButtonTextColor().cgColor
            UserCategoryKeeper.shared.addCategory(sender.category!)
            print(UserCategoryKeeper.shared.getSelectedCategories())
        }
        
    }
}

