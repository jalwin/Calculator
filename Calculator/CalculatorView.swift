//
//  CalculatorView.swift
//  Calculator
//
//  Created by Alwin Amoros on 2/28/20.
//  Copyright © 2020 Alwin Amoros. All rights reserved.
//

import UIKit
import Foundation

final class CalculatorButton: UIButton {
    
    required init(number: String) {
        super.init(frame: .zero)
        setTitle(number, for: .normal)
        backgroundColor = .red
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("Should not be using storyboard")
    }
}

final class CalculatorView: UIView {
    private let spacing: CGFloat = 1
    private var height: CGFloat {
        return (UIScreen.main.bounds.height - 2 * spacing) / 6
    }
    private var widthOfButton: CGFloat {
        return CGFloat((UIScreen.main.bounds.width ) * 0.25)
    }
    
    lazy var calculatorScreenLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .gray
        return label
    }()
    
    lazy var operandStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var misceleniousStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var topNumericStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var middleNumericStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var bottomNumericStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var zeroAndDecimalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    required init () {
        super.init(frame: .zero)
        backgroundColor = .black
        setupOutputScreen()
        setupNumericButtons()
        print("\(widthOfButton) + \(UIScreen.main.bounds.width)" )
    }
        
    private func setupOutputScreen() {
        addSubview(calculatorScreenLabel)
        calculatorScreenLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        calculatorScreenLabel.heightAnchor.constraint(equalToConstant: height).isActive = true
        calculatorScreenLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        calculatorScreenLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    fileprivate func setupView() {
        addSubview(zeroAndDecimalStackView)
        addSubview(bottomNumericStackView)
        addSubview(middleNumericStackView)
        addSubview(topNumericStackView)
        addSubview(operandStackView)
        addSubview(misceleniousStackView)
    }
    
    fileprivate func setupConstraints() {
        setupMisceleniousStackView()
        setupTopNumericStackView()
        setupMiddleNumericStackView()
        setupBottomNumericStackView()
        setupzeroAndDecimalStackView()
        setupOperandStackView()
    }
    
    private func setupNumericButtons() {
        setupView()
        setupConstraints()
    }
    
    private func setupMisceleniousStackView() {
        let clearButton = CalculatorButton(number: "C")
        let alternatePositiveNegativeButton = CalculatorButton(number: "+/-")
        let percentButton = CalculatorButton(number: "%")
        
        misceleniousStackView.addArrangedSubview(clearButton)
        misceleniousStackView.addArrangedSubview(alternatePositiveNegativeButton)
        misceleniousStackView.addArrangedSubview(percentButton)
        
        misceleniousStackView.topAnchor.constraint(equalTo: calculatorScreenLabel.bottomAnchor, constant: spacing).isActive = true
        misceleniousStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        misceleniousStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        misceleniousStackView.trailingAnchor.constraint(equalTo: operandStackView.leadingAnchor).isActive = true
    }
    
    private func setupTopNumericStackView() {
        for num in 7...9 {
            let numberButton = CalculatorButton(number: String(num))
            numberButton.widthAnchor.constraint(equalToConstant: widthOfButton).isActive = true
            topNumericStackView.addArrangedSubview(numberButton)
        }
        topNumericStackView.topAnchor.constraint(equalTo: misceleniousStackView.bottomAnchor).isActive = true
        topNumericStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        topNumericStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topNumericStackView.trailingAnchor.constraint(equalTo: operandStackView.leadingAnchor).isActive = true
    }
    
    private func setupOperandStackView() {
        let divisionButton = CalculatorButton(number: "/")
        divisionButton.widthAnchor.constraint(equalToConstant: widthOfButton).isActive = true
        divisionButton.backgroundColor = .orange
        let multiplyingButton = CalculatorButton(number: "x")
        multiplyingButton.widthAnchor.constraint(equalToConstant: widthOfButton).isActive = true
        multiplyingButton.backgroundColor = .orange
        let additionButton = CalculatorButton(number: "+")
        additionButton.widthAnchor.constraint(equalToConstant: widthOfButton).isActive = true
        additionButton.backgroundColor = .orange
        let subtractingButton = CalculatorButton(number: "-")
        subtractingButton.widthAnchor.constraint(equalToConstant: widthOfButton).isActive = true
        subtractingButton.backgroundColor = .orange
        let equalButton = CalculatorButton(number: "=")
        equalButton.widthAnchor.constraint(equalToConstant: widthOfButton).isActive = true
        equalButton.backgroundColor = .orange
        
        operandStackView.addArrangedSubview(divisionButton)
        operandStackView.addArrangedSubview(multiplyingButton)
        operandStackView.addArrangedSubview(additionButton)
        operandStackView.addArrangedSubview(subtractingButton)
        operandStackView.addArrangedSubview(equalButton)
        
        operandStackView.topAnchor.constraint(equalTo: calculatorScreenLabel.bottomAnchor, constant: spacing).isActive = true
        operandStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -spacing).isActive = true
        operandStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        operandStackView.leadingAnchor.constraint(equalTo: topNumericStackView.trailingAnchor).isActive = true
    }
    
    private func setupzeroAndDecimalStackView() {
        let zeroButton = CalculatorButton(number: "0")
        zeroButton.widthAnchor.constraint(equalToConstant: (widthOfButton) * 2).isActive = true
        let decimalButton = CalculatorButton(number: ".")
        decimalButton.widthAnchor.constraint(equalToConstant: widthOfButton).isActive = true
        
        zeroAndDecimalStackView.addArrangedSubview(zeroButton)
        zeroAndDecimalStackView.addArrangedSubview(decimalButton)
        
        zeroAndDecimalStackView.topAnchor.constraint(equalTo: bottomNumericStackView.bottomAnchor).isActive = true
        zeroAndDecimalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -spacing).isActive = true
        zeroAndDecimalStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        zeroAndDecimalStackView.trailingAnchor.constraint(equalTo: operandStackView.leadingAnchor).isActive = true
    }
    
    private func setupBottomNumericStackView() {
        for num in 1...3 {
            let numberButton = CalculatorButton(number: String(num))
            numberButton.widthAnchor.constraint(equalToConstant: widthOfButton).isActive = true
            numberButton.backgroundColor = .lightGray
            bottomNumericStackView.addArrangedSubview(numberButton)
        }
        
        bottomNumericStackView.topAnchor.constraint(equalTo: middleNumericStackView.bottomAnchor).isActive = true
        bottomNumericStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        bottomNumericStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bottomNumericStackView.trailingAnchor.constraint(equalTo: operandStackView.leadingAnchor).isActive = true
    }
    
    private func setupMiddleNumericStackView() {
        for num in 4...6 {
            let numberButton = CalculatorButton(number: String(num))
            numberButton.widthAnchor.constraint(equalToConstant: widthOfButton).isActive = true
            numberButton.backgroundColor = .darkGray
            middleNumericStackView.addArrangedSubview(numberButton)
        }
        
        middleNumericStackView.topAnchor.constraint(equalTo: topNumericStackView.bottomAnchor).isActive = true
        middleNumericStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
        middleNumericStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        middleNumericStackView.trailingAnchor.constraint(equalTo: operandStackView.leadingAnchor).isActive = true
    }
    
}
