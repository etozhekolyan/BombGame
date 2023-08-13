//
//  NavigationController.swift
//  Bomb
//
//  Team №9 | Swift Marathon 8.0
//
import UIKit

extension UINavigationController {
    
    func setNavigationBarTitle(for viewController: UIViewController) {
        let barTitle = UILabel()
        barTitle.text = viewController.title
        barTitle.font = UIFont(name: "Dela Gothic One", size: 30)
        barTitle.textColor = UIColor(red: 127/255, green: 68/255, blue: 167/255, alpha: 1)
        viewController.navigationItem.titleView = barTitle
    }

    func addBackButton() {
        let backButton = UIButton(type: .custom)
        let backImage = UIImage(named: "BackButton")?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(backImage, for: .normal)
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.tintColor = UIColor().getButtonColor()

        backButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        topViewController?.navigationItem.leftBarButtonItem = backBarButtonItem
    }
    
    func addPauseButton() {
        let pauseButton = UIButton(type: .custom)
        
        let pauseImage = UIImage(named: "PauseButton")?.withRenderingMode(.alwaysTemplate)
        let playImage = UIImage(named: "PlayButton")?.withRenderingMode(.alwaysTemplate)
        pauseButton.setImage(pauseImage, for: .normal)
        pauseButton.setImage(playImage, for: .selected)
        
        pauseButton.imageView?.contentMode = .scaleAspectFit
        pauseButton.tintColor = UIColor().getButtonColor()

        pauseButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        pauseButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        pauseButton.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        
        topViewController?.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: pauseButton)
    }

    @objc func backButtonTapped(_ sender: UIButton) {
        if let viewController = visibleViewController as? GameViewController {
            viewController.elementsArePaused()
        }
        popToRootViewController(animated: true)
    }
    
    @objc func pauseButtonTapped(_ sender: UIButton) {
        if let viewController = visibleViewController as? GameViewController {

            if sender.isSelected {
                viewController.elementsAreResumed()
            } else {
                viewController.elementsArePaused()
            }
            sender.isSelected.toggle()
        }
    }
}
