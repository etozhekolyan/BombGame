//
//  GameViewController.swift
//  Bomb
//
//  Team №9 | Swift Marathon 8.0
//

import UIKit
import SnapKit

class GameViewController: UIViewController {
    
    
    
    private lazy var titleLabel: UILabel = _titleLabel
    private lazy var textLabel: UILabel = _textLabel
    
    private lazy var imageView: UIImageView = _imageView
    private lazy var launchButton: UIButton = _launchButton

    override func viewDidLoad() {
        self.title = "Игра"

        super.viewDidLoad()
        setBackground()
        addSubviews()
        applyConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarTitle(for: self)
        navigationController?.addBackButton()
        navigationController?.addPauseButton()
    }

    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(textLabel)
        view.addSubview(imageView)
        view.addSubview(launchButton)
    }
    
    private func applyConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(75)
            make.leading.trailing.equalToSuperview().inset(150)
        }
        
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(54)
            make.leading.trailing.equalToSuperview().inset(23)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(0)
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

private extension GameViewController {
    
    var _titleLabel: UILabel {
        let label = UILabel()
        label.text = "Игра"
        label.textColor = UIColor(named: "textColor")
        label.textAlignment = .center
        label.font = UIFont(name: "Dela Gothic One", size: 28)
        return label
    }
    
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
        button.drawShadow()
        return button
    }
}
