//
//  GameEndViewController.swift
//  Bomb
//
//  Team №9 | Swift Marathon 8.0
//

import UIKit
import SnapKit

protocol GameEndViewControllerDelegate: AnyObject {
    func startOverGame(_ controller: GameEndViewController)
}

class GameEndViewController: UIViewController {
    
    weak var delegate: GameEndViewControllerDelegate?
    
    private var model: GameEndModel?
    private let gameEndView = GameEndView()

    override func viewDidLoad() {
        self.title = "Игра"
        super.viewDidLoad()
        setBackground()
        
        model = GameEndModel(task: getRandomTask)
        gameEndView.delegate = self
        updateTask()
        navigationController?.setNavigationBarTitle(for: self)
        navigationController?.addBackButton()
    }
    
    override func loadView() {
        super.loadView()
        self.view = gameEndView
    }
    
    lazy var getRandomTask: Task = {
        return gameEndView.tasks[Int.random(in: 0...gameEndView.getTasksLength)]
    }()
    
    func updateTask() {
        gameEndView.updateTask(with: (model?.task.task) ?? "")
    }
}

extension GameEndViewController: GameEndViewDelegate {
    func startOverButtonTapped() {
        navigationController?.popViewController(animated: true)
        delegate?.startOverGame(self)
    }
}
