//
//  GameEndView.swift
//  Bomb
//
//  Created by Мявкo on 13.08.23.
//

import UIKit

protocol GameEndViewDelegate: AnyObject {
    func startOverButtonTapped()
}

class GameEndView: UIView {
    
    var delegate: GameEndViewDelegate?
    
    let tasks = [
        Task(task: "Изобразить мимикой и жестами какое-либо знаменитое лицо"),
        Task(task: "Принять пинок от игрока слева"),
        Task(task: "Попрыгать на одной ноге вокруг игроков"),
        Task(task: "Изобразить сцену известной сказки или фильма без слов"),
        Task(task: "В следующем раунде после каждого ответа хлопать в ладоши"),
        Task(task: "Выполнить 10 отжиманий"),
        Task(task: "Сидеть на полу, раскачиваясь и напевая шаманскую песню"),
        Task(task: "Пошевелить руками свои уши"),
        Task(task: "Разговаривать со всеми 5 минут на английском"),
        Task(task: "Рассказать анекдот")
    ]
    
    private lazy var descriptionLabel: UILabel = _descriptionLabel
    private lazy var taskLabel: UILabel = _taskLabel
    private lazy var imageView: UIImageView = _imageView
    private lazy var anotherTaskButton: UIButton = _anotherTaskButton
    private lazy var startOverButton: UIButton = _startOverButton
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(descriptionLabel)
        self.addSubview(imageView)
        self.addSubview(taskLabel)
        self.addSubview(anotherTaskButton)
        self.addSubview(startOverButton)
    }
    
    private func applyConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(110)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(25)
            make.leading.equalToSuperview().inset(71)
            make.trailing.equalToSuperview().inset(55)
            make.height.equalTo(300)
        }
        
        taskLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(100)
        }
        
        anotherTaskButton.snp.makeConstraints { make in
            make.bottom.equalTo(startOverButton.snp.top).offset(-15)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(79)
        }
        
        startOverButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(79)
        }
    }
    
    lazy var getTasksLength: Int = {
        return tasks.count - 1
    }()
    
    func getRandomTask() -> String {
        return tasks[Int.random(in: 0...getTasksLength)].task
    }
    
    func updateTask(with task: String) {
        taskLabel.text = task
    }
    
    @objc func anotherTaskButtonTapped() {
        updateTask(with: getRandomTask())
    }
    
    @objc func startOverButtonTapped() {
        delegate?.startOverButtonTapped()
    }
}

extension GameEndView {
    
    var _descriptionLabel: UILabel {
        let label = UILabel()
        label.text = "Проигравший выполняет\nзадание"
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Dela Gothic One", size: 24)
        return label
    }
    
    var _imageView: UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "boom")
        return imageView
    }
    
    var _taskLabel: UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor(named: "textColor")
        label.textAlignment = .center
        label.font = UIFont(name: "Dela Gothic One", size: 20)
        return label
    }
    
    var _anotherTaskButton: UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "buttonColor")
        button.setTitle("Другое\nЗадание", for: .normal)
        button.tintColor = UIColor(named: "buttonTextColor")
        button.titleLabel?.font = UIFont(name: "Dela Gothic One", size: 24)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 40
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(anotherTaskButtonTapped), for: .touchUpInside)
        button.drawShadow()
        button.drawBorder(color: .black)
        return button
    }
    
    var _startOverButton: UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Начать\nЗаново", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(named: "buttonColor")
        button.titleLabel?.font = UIFont(name: "Dela Gothic One", size: 24)
        button.tintColor = UIColor(named: "buttonTextColor")
        button.layer.cornerRadius = 40
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(startOverButtonTapped), for: .touchUpInside)
        button.drawShadow()
        button.drawBorder(color: .black)
        return button
    }
}
