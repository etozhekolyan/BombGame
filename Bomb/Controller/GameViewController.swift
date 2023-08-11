//
//  GameViewController.swift
//  Bomb
//
//  Team №9 | Swift Marathon 8.0
//

import UIKit

class GameViewController: UIViewController {
    
    private lazy var textLabel: UILabel = _textLabel
    private lazy var imageView: UIImageView = _imageView
    private lazy var launchButton: UIButton = _launchButton
    private let questionStorage = QuestionStorage()
    private var filterQuestions: FilterQuastions?
    
    weak var timer: Timer?
    var secondsRemaining = 3
    
    var isGameStarted = false
    
    override func viewDidLoad() {
        self.title = "Игра"
        super.viewDidLoad()
        
        setBackground()
        addSubviews()
        applyConstraints()
    }
    
    override func loadView() {
        super.loadView()
        filterQuestions = FilterQuastions(questions: questionStorage)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarTitle(for: self)
        navigationController?.addBackButton()
        navigationController?.addPauseButton()
    }
    
    func updateLabel(with text: String) {
        textLabel.text = text
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func pauseTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func updateTimer() {
        secondsRemaining -= 1
        if secondsRemaining == 0 {
            pauseTimer()
            openNewScreen()
        }
    }
    
    @objc func launchButtonTapped() {
        isGameStarted = true
        launchButton.isHidden = true
        textLabel.text = "Здесь типа какое-то задание"
        startTimer()
    }

    private func addSubviews() {
        view.addSubview(textLabel)
        view.addSubview(imageView)
        view.addSubview(launchButton)
    }
    
    private func applyConstraints() {
        textLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(130)
            make.leading.trailing.equalToSuperview().inset(23)
        }
        
        imageView.snp.makeConstraints { make in
            make.bottom.equalTo(launchButton.snp.top).inset(-90)
            make.leading.equalToSuperview().inset(74)
            make.trailing.equalToSuperview().inset(0)
            make.height.equalTo(352)
        }
        
        launchButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(66)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(79)
        }
    }
}

extension GameViewController: GameEndViewControllerDelegate {
    func startOverGame(_ controller: GameEndViewController) {
        launchButtonTapped()
        secondsRemaining = 3
    }
}

extension GameViewController {
    
    var _textLabel: UILabel {
        let label = UILabel()
        label.text = "Нажмите\n “Запустить” чтобы начать игру"
        label.numberOfLines = 0
        label.textColor = UIColor(named: "textColor")
        label.textAlignment = .center
        label.font = UIFont(name: "Dela Gothic One", size: 28)
        return label
    }
    
    var _imageView: UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bomb")
        return imageView
    }
    
    var _launchButton: UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "buttonColor")
        button.titleLabel?.font = UIFont(name: "Dela Gothic One", size: 24)
        button.setTitle("Запустить", for: .normal)
        button.tintColor = UIColor(named: "buttonTextColor")
        button.layer.cornerRadius = 40
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(launchButtonTapped), for: .touchUpInside)
        button.drawShadow()
        return button
    }
    
    func openNewScreen() {
        let controller = GameEndViewController()
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
}
