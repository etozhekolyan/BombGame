//
//  RulesView.swift
//  Bomb
//
//  Created by Nickolay Vasilchenko on 08.08.2023.
//

import UIKit

class RulesView: UIView {
    
    private let categoryView = CategoryView()
    private let contentView = UIView()
    private let rules = [
        Rule(numberOfRule: "1", ruleText: "Все игроки становятся в круг."),
        Rule(numberOfRule: "2", ruleText: "Первый игрок берет телефон \n и нажимает кнопку:"),
        Rule(numberOfRule: "3", ruleText: "На экране появляется вопрос \n “Назовите Фрукт”."),
        Rule(numberOfRule: "4", ruleText: "Игрок отвечает на вопрос и \n после правильного ответа \n передает телефон следующему \n игроку (правильность ответа \n определяют другие участники)."),
        Rule(numberOfRule: "5", ruleText: "Игроки по кругу отвечают на \n один и тот же вопрос до тех пор, \n пока не взорвется бомба."),
        Rule(numberOfRule: "6", ruleText: "Проигравшим считается тот, в \n чьих руках взорвалась бомба."),
        Rule(numberOfRule: "7", ruleText: "Если в настройках выбран \n режим игры “С Заданиями”, то \n проигравший выполняет \n задание.")
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addToHierarchy()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = UIStackView.Distribution.fill
        stack.spacing = 0
        return stack
    }()
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    
    private let anotherHeadLabel: UILabel = {
       let label = UILabel()
        label.heightAnchor.constraint(equalToConstant: 96).isActive = true
        label.textAlignment = .center
        label.contentMode = .bottom
        label.font = UIFont(name: "Dela Gothic One", size: 24)
        label.textColor = UIColor(red: 130 / 255,
                                  green: 52 / 255,
                                  blue: 208 / 255,
                                  alpha: 1.0)
        label.text = "Категории"
        return label
    }()
    
    private let exampleButtonView: UIView = {
        let view = UIView()
        let label = UILabel(frame: CGRect(x: -4, y: 7, width: 103, height: 13))
        
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor().getButtonColor()
        view.layer.borderWidth = 1
        view.drawShadow()
        
        view.widthAnchor.constraint(equalToConstant: 98).isActive = true
        view.heightAnchor.constraint(equalToConstant: 27).isActive = true
        
        label.textAlignment = .center
        label.text = "Старт игры"
        label.textColor = UIColor().getButtonTextColor()
        label.font = UIFont(name: "Dela Gothic One", size: 12)
        
        view.addSubview(label)
        return view
    }()
    
    private let categoryDescriptionLabel: UILabel = {
        let label = UILabel()
        label.heightAnchor.constraint(equalToConstant: 150).isActive = true
        label.textAlignment = .center
        label.font = UIFont(name: "Dela Gothic One", size: 24)
        label.text = "Можно выбрать \n сразу несколько \n категорий для игры."
        label.numberOfLines = 0
        return label
    }()
    
    private let anotherCategoryDescriptionLabel: UILabel = {
        let label = UILabel()
        label.heightAnchor.constraint(equalToConstant: 150).isActive = true
        label.textAlignment = .center
        label.font = UIFont(name: "Dela Gothic One", size: 24)
        label.text = "В игре доступно 6 \n категорий и более \n 90 вопросов."
        label.numberOfLines = 0
        return label
    }()

    
    private func addToHierarchy() {
        self.addSubview(backgroundImage)
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(RuleViewItem(rule: rules[0], height: 50, exampleView: nil))
        stackView.addArrangedSubview(RuleViewItem(rule: rules[1], height: 150, exampleView: exampleButtonView))
        stackView.addArrangedSubview(RuleViewItem(rule: rules[2], height: 100, exampleView: nil))
        stackView.addArrangedSubview(RuleViewItem(rule: rules[3], height: 150, exampleView: nil))
        stackView.addArrangedSubview(RuleViewItem(rule: rules[4], height: 100, exampleView: nil))
        stackView.addArrangedSubview(RuleViewItem(rule: rules[5], height: 100, exampleView: nil))
        stackView.addArrangedSubview(RuleViewItem(rule: rules[6], height: 150, exampleView: nil))
        stackView.addArrangedSubview(anotherHeadLabel)
        stackView.addArrangedSubview(anotherCategoryDescriptionLabel)
        stackView.addArrangedSubview(categoryDescriptionLabel)
        stackView.addArrangedSubview(categoryView)
    }
    
    private func setupLayouts() {
        layoutBackgroundImage()
        layoutScrollView()
        layoutContentView()
        layoutStackView()
    }
    
    private func layoutContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    private func layoutScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func layoutBackgroundImage() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func layoutStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}


