//
//  Extension.swift
//  Bomb
//
//  Created by Мявкo on 7.08.23.
//

import UIKit

extension UIViewController {
    
    func setBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.systemOrange.cgColor,
            UIColor(red: 1, green: 187/255, blue: 48/255, alpha: 1).cgColor,
            ]
        view.layer.addSublayer(gradientLayer)
    }
}

extension UILabel {

    func addSpaceBetweenLines(spacingValue: CGFloat) {
        guard let textString = text else { return }

        let attributedString = NSMutableAttributedString(string: textString)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacingValue

        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length
        ))
        attributedText = attributedString
    }
}

extension UIView {

    func drawShadow() {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
    }
    
    func drawBorder(color: UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 1.0
    }
}

extension UIColor {
    func getButtonColor() -> UIColor {
        return UIColor(red: 247/255, green: 212/255, blue: 0, alpha: 1)
    }
    func getTextColor() -> UIColor {
        return UIColor(red: 106/255, green: 1/255, blue: 25/255, alpha: 1)
    }
    
    func getButtonTextColor() -> UIColor {
        return UIColor(red: 228/255, green: 48/255, blue: 41/255, alpha: 1)
    }
}

extension UIButton {
    private struct AssociatedKeys {
        static var category = "category"
    }
    var category: Category? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.category) as? Category
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.category, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
