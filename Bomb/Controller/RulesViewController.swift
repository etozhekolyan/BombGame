//
//  RulesViewController.swift
//  Bomb
//
//  Team №9 | Swift Marathon 8.0
//
import UIKit

class RulesViewController: UIViewController {
    
    private let rulesView = RulesView()
//    private let rules = [
//        Rule(numberOfRule: "1", ruleText: "Все игроки становятся в круг."),
//        Rule(numberOfRule: "1", ruleText: "Первый игрок берет телефон \n и нажимает кнопку:"),
//        Rule(numberOfRule: "1", ruleText: "На экране появляется вопрос \n “Назовите Фрукт”."),
//        Rule(numberOfRule: "1", ruleText: "Игрок отвечает на вопрос и \n после правильного ответа \n передает телефон следующему \n игроку (правильность ответа \n определяют другие участники)."),
//        Rule(numberOfRule: "1", ruleText: "Игроки по кругу отвечают на \n один и тот же вопрос до тех пор, \n пока не взорвется бомба."),
//        Rule(numberOfRule: "1", ruleText: "Проигравшим считается тот, в \n чьих руках взорвалась бомба."),
//        Rule(numberOfRule: "1", ruleText: "Если в настройках выбран \n режим игры “С Заданиями”, то \n проигравший выполняет \n задание.")
//    ]

    override func viewDidLoad() {
        super.viewDidLoad()
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
