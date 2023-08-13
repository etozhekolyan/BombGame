//
//  GameView.swift
//  Bomb
//
//  Created by Мявкo on 12.08.23.
//
import UIKit
import Lottie

protocol GameViewDelegate {
    func launchButtonTapped()
}

class GameView: UIView {
    
    var delegate: GameViewDelegate?
    
    private var animationView: LottieAnimationView!
    
    private lazy var textLabel: UILabel = _textLabel
    private lazy var imageView: UIImageView = _imageView
    private lazy var launchButton: UIButton = _launchButton
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(textLabel)
        self.addSubview(imageView)
        self.addSubview(launchButton)
    }
    
    private func applyConstraints() {
        textLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(130)
            make.leading.trailing.equalToSuperview().inset(23)
        }
        
        imageView.snp.makeConstraints { make in
            make.bottom.equalTo(launchButton.snp.top).inset(-173)
            make.leading.equalToSuperview().inset(83)
            make.trailing.equalToSuperview().inset(45)
            make.height.equalTo(193)
        }
        
        launchButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(66)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(79)
        }
    }
    
    func updateLabel(with text: String) {
        textLabel.text = text
    }
    
    func playAnimation(name: String, loopMode: LottieLoopMode) {
        animationView = .init(name: name, configuration: LottieConfiguration(renderingEngine: .mainThread))
         
        animationView.frame = self.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.animationSpeed = 0.85
         
        self.addSubview(animationView)
        animationView.play()
    }
    
    func removeAnimation() {
        animationView.removeFromSuperview()
    }
    
    func pauseAnimation() {
        animationView.pause()
    }
    
    func resumeAnimation() {
        animationView.play()
    }
    
    @objc func launchButtonTapped() {
        delegate?.launchButtonTapped()
        launchButton.isHidden = true
        imageView.removeFromSuperview()
    }
}

extension GameView {
    
    var _textLabel: UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor(named: "textColor")
        label.textAlignment = .center
        label.font = UIFont(name: "Dela Gothic One", size: 28)
        return label
    }
    
    var _imageView: UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "animateBomb")
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
}
