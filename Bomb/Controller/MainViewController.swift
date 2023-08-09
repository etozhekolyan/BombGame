////
////  MainViewController.swift
////  Bomb
////
////  Team №9 | Swift Marathon 8.0
////
import UIKit


class MainViewController: UIViewController {
    
    private lazy var labelGameText: UILabel = _labelGameText
    private lazy var labelBombText: UILabel = _labelBombText
    private lazy var bombImageView: UIView = _bombImageView
    private lazy var startGameButton: UIButton = _startGameButton
    private lazy var selectCategoryButton: UIButton = _selectCategoryButton
    private lazy var rulesButton: UIButton = _rulesButton
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackground()
        addSubviews()
        setConstraints()
        
      //  debugPrint(UIFont.familyNames)
    }
    
    
    func addSubviews() {
        view.addSubview(labelGameText)
        view.addSubview(labelBombText)
        view.addSubview(bombImageView)
        view.addSubview(startGameButton)
        view.addSubview(selectCategoryButton)
        view.addSubview(rulesButton)
//        
    }
    
    // функция старта игры
    //   @objc func startButtonTapped() { }
    
    // функция выбора категории
    //   @objc func categoryButtonTapped() { }
    
    
    // функция перехода в настройки
    //   @objc func rulesButtonTapped() { }
    
    
    
    
    private func setConstraints() {
        
        
        labelGameText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelGameText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            labelGameText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            labelGameText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
  
            
        ])
        
        labelBombText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelBombText.topAnchor.constraint(equalTo: labelGameText.bottomAnchor, constant: -20),
            labelBombText.trailingAnchor.constraint(equalTo: labelGameText.trailingAnchor),
            labelBombText.leadingAnchor.constraint(equalTo: labelGameText.leadingAnchor),
            
            
        ])

        bombImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bombImageView.topAnchor.constraint(lessThanOrEqualTo: labelBombText.bottomAnchor, constant: 10),
            bombImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
           bombImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            bombImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 280)

        ])


        startGameButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           startGameButton.topAnchor.constraint(equalTo: bombImageView.bottomAnchor, constant: 10),
           startGameButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 38),
           startGameButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -38)
          

        ])
        
        selectCategoryButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        selectCategoryButton.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 20),
        selectCategoryButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 38),
        selectCategoryButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -38),
       
        ])
        
        rulesButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        rulesButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        rulesButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        rulesButton.widthAnchor.constraint(equalToConstant: 64),
        rulesButton.heightAnchor.constraint(equalToConstant: 64)
        ])
//
    }
}


extension MainViewController {
    
   
    
    var _labelGameText: UILabel {
        
        let label = UILabel()
        label.text = "Игра для компании"
        label.textColor = UIColor.black
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.font = UIFont(name: "Dela Gothic One", size: 35)
        
        return label
    }
    
    var _labelBombText: UILabel {
        let label = UILabel()
        label.text = "БОМБА"
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = UIColor(named: "textColor")
        label.font = UIFont(name: "Dela Gothic One", size: 60)
        
        
        return label
    }
    
    var _bombImageView: UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bombIcon")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
     
  
  
        
        
        return imageView
    }
    
    
    
    var _startGameButton: UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Старт игры", for: .normal)
        button.titleLabel?.font = UIFont(name: "Dela Gothic One", size: 34)
        button.tintColor = UIColor(named: "buttonTextColor")
        button.backgroundColor = UIColor(named: "buttonColor")
        button.layer.cornerRadius = 35
        button.contentMode = .center
        
        // закомментил действие кнопки
        //button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
        return button
    }
    
    var _selectCategoryButton: UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Категории", for: .normal)
        button.tintColor = UIColor(named: "buttonTextColor")
        button.backgroundColor = UIColor(named: "buttonColor")
        button.titleLabel?.font = UIFont(name: "Dela Gothic One", size: 34)
        button.layer.cornerRadius = 35
        button.contentMode = .center
        
        // закомментил действие кнопки
        //button.addTarget(self, action: #selector(categorytButtonTapped), for: .touchUpInside)
        
        return button
    }
    
    var _rulesButton: UIButton {
        let button = UIButton(type: .system)
        button.setTitle("?", for: .normal)
        button.titleLabel?.font = UIFont(name: "Dela Gothic One", size: 40)
        button.contentMode = .center
        button.tintColor = UIColor(named: "buttonColor")
        button.backgroundColor = UIColor(named: "buttonTextColor")
        button.layer.cornerRadius = 32
        button.layer.borderWidth = 6
        button.layer.borderColor = UIColor(named: "buttonColor")?.cgColor
        
        
        // закомментил действие кнопки
        //button.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
        
        return button
    }
}
