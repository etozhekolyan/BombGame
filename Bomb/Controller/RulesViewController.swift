//
//  RulesViewController.swift
//  Bomb
//
//  Team №9 | Swift Marathon 8.0
//
import UIKit

class RulesViewController: UIViewController {
    
    private let rulesView = RulesView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Правила"
        navigationController?.addBackButton()
        navigationController?.setNavigationBarTitle(for: self)
    }
    
    override func loadView() {
        super.loadView()
        self.view = rulesView
    }

    
}


struct Rule {
    let numberOfRule: String
    let ruleText: String
}
