//
//  ViewController.swift
//  Calc2
//
//  Created by Jim Dong on 7/24/15.
//  Copyright (c) 2015 Jim Dong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var userIsInMiddleOfTyping = false
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if (userIsInMiddleOfTyping) {
            display.text = display.text! + digit
        }
        else{
            display.text = digit
            userIsInMiddleOfTyping = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        if userIsInMiddleOfTyping{
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            }
        }
        else {
            displayValue = 0
        }
    }
    
    @IBAction func enter() {
        userIsInMiddleOfTyping = false
        if let result = brain.pushOperand(displayValue){
            displayValue = result
        }
        else {
            displayValue = 0
        }
    }
    
    
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInMiddleOfTyping = false
        }
    }
    
    
    
}

