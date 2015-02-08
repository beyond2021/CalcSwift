//
//  ViewController.swift
//  CalcSwift
//
//  Created by KEEVIN MITCHELL on 2/5/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var brain = CalculatorBrain() //green arrow from controller to model

    @IBOutlet weak var display: UILabel!
    
    
    var userIsInTheMiddleOfTypingNumber = false
    
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        println("digit = \(digit)")
        
        if userIsInTheMiddleOfTypingNumber{
            display.text = display.text! + digit
        } else{
            display.text = digit
            userIsInTheMiddleOfTypingNumber = true
        }
    }
    
  //  var operandStack = Array<Double>()
    
    @IBAction func operate(sender: UIButton) {
        if userIsInTheMiddleOfTypingNumber{
            enter()
        }
        if let operation = sender.currentTitle{
     
            if let result = brain.performOperation(operation)
            {
                
                displayValue = result
                
            } else{
                
                displayValue = 0
            }
        
            
    }
    }
    
    
    
    
    @IBAction func enter() {
        
        userIsInTheMiddleOfTypingNumber = false
        
        
        
        brain.pushOperand(displayValue)
        
        if let result = brain.pushOperand(displayValue){
           //Update display
            displayValue = result
            
        } else {
            
            displayValue = 0
        }
    }
    
    var displayValue: Double
        {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
                    }
        set{
            
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingNumber = false
            
        }
        
        
    }
    
}

