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
    
    var userIsInTheMiddleOfTypingNumber:Bool = false
   
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
}

