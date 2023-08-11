//
//  CategoryView.swift
//  Bomb
//
//  Created by Nickolay Vasilchenko on 08.08.2023.
//

import UIKit

class CategoryView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.heightAnchor.constraint(equalToConstant: 320).isActive = true
        let firsticon = configureCategoryIcon("image 6", "Природа", x: 40, y: 0)
        let secondicon = configureCategoryIcon("image 5", "Исскуство и\n кино", x: 192, y: 0)
        let thirdicon = configureCategoryIcon("", "Разное", x: 40, y: 165)
        let fourth = configureCategoryIcon("image 2", "Спорт и\n Хобби", x: 192, y: 165)
        self.addSubview(firsticon)
        self.addSubview(secondicon)
        self.addSubview(thirdicon)
        self.addSubview(fourth)
        
    }
    
    private func configureCategoryIcon(_ iconName: String, _ categoryName: String, x: Int, y: Int) -> UIView {
        let view = getIconView(x: x, y: y)
        view.addSubview(getCheckboxImage())
        view.addSubview(getCategoryIcon(iconName))
        view.addSubview(getCategotyNameLabel(categoryName))
        return view
    }
    
    private func getIconView(x: Int, y: Int) -> UIView {
        let view = UIView(frame: CGRect(x: x, y: y, width: 145, height: 145))
        view.backgroundColor = UIColor(red: 126 / 255,
                                       green: 52 / 255,
                                       blue: 163 / 255,
                                       alpha: 1.0)
        view.layer.cornerRadius = 50
        view.layer.borderWidth = 1
        
        return view
    }
    
    private func getCheckboxImage() -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 42, height: 42))
        imageView.contentMode = .bottomRight
        imageView.image = UIImage(named: "checkCircle")
        return imageView
    }
    
    private func getCategoryIcon(_ imageName: String) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 40, y: 19, width: 79, height: 70)) // 89 80
        imageView.image = UIImage(named: imageName)
        return imageView
    }
    
    private func getCategotyNameLabel(_ name: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 9, y: 100, width: 128, height: 50))
        label.text = name
        label.font = UIFont(name: "Dela Gothic One", size: 16)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }
}
