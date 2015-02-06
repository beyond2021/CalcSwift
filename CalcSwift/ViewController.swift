//
//  ViewController.swift
//  CalcSwift
//
//  Created by KEEVIN MITCHELL on 2/5/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel! //This is set when we hook up to storyboard so we just unwrap it. implicitly unwrapped optional.
    
   // var userIsInTheMiddleOfTypingNumber:Bool = false
    var userIsInTheMiddleOfTypingNumber = false //inferred
    
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle! // didnt put type for variable. nil means not set. ! unwraps the optional if its set and crashes if its nil.
        println("digit = \(digit)")
        
        //Now that we have the digit let add it (append it) to the end of the display label.
        if userIsInTheMiddleOfTypingNumber{
        
        display.text = display.text! + digit
        } else{
           //Get rid of zero when typing number
          display.text = digit
            userIsInTheMiddleOfTypingNumber = true
        }
        
        
    }
    
    //Our Stack
   // var operandStack:Array<Double> = Array<Double>() //Initializing with an empty array with no arguments. Every property MUST be initialized.
    var operandStack = Array<Double>()//inferred.
    
    
    
   
    
    
    
    //This is tjhe controller of the MVC
    
    @IBAction func operate(sender: UIButton) {
       
        
        //We will do the same thing we will get the senders current title
        let operation = sender.currentTitle!
        
        //Lets give the user an automatic enter.
        if userIsInTheMiddleOfTypingNumber{
            enter()
            
        }
        
            //We are going to switch on the operation string
        switch operation{
            //multiply the last 2 things on the stack
        case "×": performOperation{ $0 - $1 }
        case "÷": performOperation{ $1 / $0 }
        case "+": performOperation{ $0 + $1 }
        case "−": performOperation{ $1 - $0 }
        case "√": performOperation{ sqrt($0) }
            
        default: break //here we break out of the switch
        }
        
        
    }
    
    
    //Function takes 2 doubles and returns a double
    func performOperation(operation: (Double, Double) -> Double){
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter() //Automatic enter here too
        }
        
    }
    
    func performOperation(operation: (Double) -> Double){
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter() //Automatic enter here too
        }
        
    }
    
    
    
    @IBAction func enter() {
      //We want to put the numbers in our display on to our stack
        userIsInTheMiddleOfTypingNumber = false
        operandStack.append(displayValue)
        println("Operand Stack = \(operandStack)") //OperanStack is an array
        
        
    }
    //Computed property
    // we want to use display.text but we need a double and its a string. So we have to (compute )calculate it.
    var displayValue: Double
        {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
            
        }
        set{
            
        // convert newVale into text "\(newValue)"
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingNumber = false // someone set the display text
        }
        
        
    }
    
}

