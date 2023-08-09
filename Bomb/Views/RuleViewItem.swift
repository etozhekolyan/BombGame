//
//  RuleView.swift
//  Bomb
//
//  Created by Nickolay Vasilchenko on 08.08.2023.
//

import UIKit

class RuleViewItem: UIView {
    
    private let number: String
    private let rule: String?
    private let exampleView: UIView?
    
    required init(rule: Rule, height: CGFloat, exampleView: UIView?) {
        self.number = rule.numberOfRule
        self.rule = rule.ruleText
        self.exampleView = exampleView
        super.init(frame: .zero)
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.widthAnchor.constraint(equalToConstant: 300).isActive = true
        addToView()
        layoutNumberCircle()
        layoutRuleLabel()
        layoutExampleView()
        distributeValues()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let numberCircle: UIView = {
        let circleView = UIView()
        //TODO: Change color
        circleView.backgroundColor = .purple
        circleView.layer.cornerRadius = 15
        circleView.drawShadow()
        return circleView
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 7, width: 16, height: 16))
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .yellow
        return label
    }()
    
    private var ruleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.sizeToFit()
        label.font = UIFont(name: "DelaGothicOne", size: 16)
        return label
    }()
    
    private func addToView() {
        self.addSubview(numberCircle)
        numberCircle.addSubview(numberLabel)
        self.addSubview(ruleLabel)
    }
    
    private func layoutNumberCircle() {
        numberCircle.translatesAutoresizingMaskIntoConstraints = false
        numberCircle.widthAnchor.constraint(equalToConstant: 29).isActive = true
        numberCircle.heightAnchor.constraint(equalToConstant: 29).isActive = true
        numberCircle.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        numberCircle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    }
    
    private func layoutRuleLabel() {
        ruleLabel.translatesAutoresizingMaskIntoConstraints = false
        ruleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        ruleLabel.leadingAnchor.constraint(equalTo: numberCircle.trailingAnchor, constant: 4).isActive = true
        ruleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4).isActive = true
        ruleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
    }
    
    private func layoutExampleView() {
        guard let exampleView = exampleView else { return }
        self.addSubview(exampleView)
        exampleView.translatesAutoresizingMaskIntoConstraints = false
        exampleView.widthAnchor.constraint(equalToConstant: 96).isActive = true
        exampleView.heightAnchor.constraint(equalToConstant: 27).isActive = true
        exampleView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        exampleView.topAnchor.constraint(equalTo: ruleLabel.bottomAnchor, constant: 8).isActive = true
        exampleView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    }
    
    private func distributeValues() {
        numberLabel.text = number
        ruleLabel.text = rule
    }

}
