//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    // MARK: IBOUTLET
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    // MARK: VAR
    var calculation = Calculation()
    
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        bindAlert()
    }
    
    // MARK: alert controller
    private func presentUIAlertController(message: String) {
        let alertVc = UIAlertController(title: "Zero!", message: message, preferredStyle: .alert)
        alertVc.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVc, animated: true, completion: nil)
    }
    
    private func bindAlert() {
        calculation.displayAlert = presentUIAlertController(message: )
    }
    
    // MARK: ACTIONS
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        if let numberText = sender.title(for: .normal) {
            calculation.addNumber(number: numberText)
        }
        textView.text = calculation.calculText
    }
    
    @IBAction func tappedCommaButton(_ sender: UIButton) {
        if let commaText = sender.title(for: .normal) {
            calculation.addComma(comma: commaText)
        }
        textView.text = calculation.calculText
    }
    
    @IBAction func tappedClearButton(_ sender: UIButton) {
        calculation.resetOperator()
        textView.text = calculation.calculText
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        calculation.addOperator(_operator: "+")
        textView.text = calculation.calculText
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        calculation.addOperator(_operator: "/")
        textView.text = calculation.calculText
    }
    
    @IBAction func tappeMultiplicationButton(_ sender: UIButton) {
        calculation.addOperator(_operator: "x")
        textView.text = calculation.calculText
    }
    
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        calculation.addOperator(_operator: "-")
        textView.text = calculation.calculText
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        calculation.equalOperator()
        textView.text = calculation.calculText
    }

}
