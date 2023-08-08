//
//  MainViewController.swift
//  Bomb
//
//  Team №9 | Swift Marathon 8.0
//
import UIKit

class MainViewController: UIViewController {
let button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle("Играть", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        view.backgroundColor = .systemBlue
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        view.addSubview(button)
        button.addTarget(self, action: #selector(didPressButton), for: .touchUpInside)
    }
    
    
    @objc func didPressButton() {
        let gameVC = GameViewController()
        navigationController?.pushViewController(gameVC, animated: true)
        
    }
    
}

