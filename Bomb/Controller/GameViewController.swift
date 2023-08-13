//
//  GameViewController.swift
//  Bomb
//
//  Team №9 | Swift Marathon 8.0
//

import UIKit
import AVFoundation

protocol GameControllerDelegate {
    func launchButtonTapped()
}

enum Duration {
    case ten
    case twenty
    case thirty
}

enum State {
    case pause
    case resume
}

class GameViewController: UIViewController {

    private let model = GameModel(text: "Нажмите “Запустить” чтобы начать игру")
    private let gameView = GameView()
    
    var player: AVAudioPlayer!
    
    let duration: Duration = .ten
    var state: State?
    let task: String = "Здесь типа какое-то задание"
    
    weak var timer: Timer?
    var totalSeconds: Int {
        switch duration {
        case .ten: return 11 // т.к. в updateTime secondsRemaining - 1, а значит 10 пропустит
        case .twenty: return 20
        case .thirty: return 30
        }
    }
    
    lazy var secondsRemaining = totalSeconds
    
    override func viewDidLoad() {
        self.title = "Игра"
        super.viewDidLoad()
        setBackground()
        
        gameView.delegate = self
        gameView.updateLabel(with: model.text)
        navigationController?.setNavigationBarTitle(for: self)
        navigationController?.addBackButton()
    }
    
    override func loadView() {
        super.loadView()
        self.view = gameView
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func makeSound(state: State) {
        switch state {
        case .pause:
            player.pause()
        case .resume:
            player.play()
        }
    }
    
    func pauseTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func elementsArePaused() {
        makeSound(state: .pause)
        gameView.pauseAnimation()
        pauseTimer()
        updateLabel(with: "Пауза")
    }
    
    func elementsAreResumed() {
        makeSound(state: .resume)
        gameView.resumeAnimation()
        startTimer()
        updateLabel(with: task)
    }
    
    @objc func updateTimer() {
        secondsRemaining -= 1
        if secondsRemaining == 0 {
            pauseTimer()
            openNewScreen()
        } else if secondsRemaining == 1 {
            playSound(name: "BombExplosion")
        } else if secondsRemaining == 10 {
            gameView.removeAnimation()
            gameView.playAnimation(name: "bomb2", loopMode: .playOnce)
        }
    }
    
    func playSound(name: String) {
        let url = Bundle.main.url(forResource: name, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func updateLabel(with text: String) {
        gameView.updateLabel(with: text)
    }
    
    func playTimerBomb(for duration: Duration) {
        switch duration {
        case .ten:
            playSound(name: "TimerBombSeconds_10")
        case .twenty:
            playSound(name: "TimerBombSeconds_20")
        case .thirty:
            playSound(name: "TimerBombSeconds_30")
        }
    }
    
    func buttonTapped() {
        playTimerBomb(for: duration)
        startTimer()
        gameView.updateLabel(with: task)
        gameView.playAnimation(name: "bomb1", loopMode: .loop)
        navigationController?.addPauseButton()
    }
    
    func openNewScreen() {
        let controller = GameEndViewController()
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension GameViewController: GameViewDelegate {
    func launchButtonTapped() {
        buttonTapped()
    }
}

extension GameViewController: GameEndViewControllerDelegate {
    func startOverGame(_ controller: GameEndViewController) {
        gameView.removeAnimation()
        buttonTapped()
        secondsRemaining = totalSeconds
    }
}
