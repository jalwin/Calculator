//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Alwin Amoros on 2/28/20.
//  Copyright © 2020 Alwin Amoros. All rights reserved.
//

import UIKit
import Foundation

final class CalculatorViewController: UIViewController {
    var calculatorView: CalculatorView!
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    required init() {
        calculatorView = CalculatorView()
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        setupCalculatorViewConstraint()
        setupCalculatorButtonActions()
    }
    
    private func pressedCalculatorButton(_ sender: UIButton) {
        calculatorView.calculatorScreenLabel.text?.append(sender.titleLabel!.text!)
    }
    
    @objc private func buttonPressed(_ sender: AnyObject?) {
        let button = sender as! UIButton
        print("pressed: \(button.titleLabel!.text!)")
    }
    
    private func setupCalculatorButtonActions() {
        var button: UIButton
        
        for currentButton in calculatorView.topNumericStackView.arrangedSubviews {
            button = currentButton as! UIButton
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        }
        
        for currentButton in calculatorView.middleNumericStackView.arrangedSubviews {
            button = currentButton as! UIButton
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        }
        
        for currentButton in calculatorView.bottomNumericStackView.arrangedSubviews {
            button = currentButton as! UIButton
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        }
        
        for currentButton in calculatorView.zeroAndDecimalStackView.arrangedSubviews {
            button = currentButton as! UIButton
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        }
    
    }
    
    private func setupCalculatorViewConstraint() {
        view.addSubview(calculatorView)
        calculatorView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        calculatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        calculatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        calculatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        calculatorView.translatesAutoresizingMaskIntoConstraints = false
    }
}
