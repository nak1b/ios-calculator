//
//  ViewController.swift
//  Calculator
//
//  Created by Nakib on 2/27/15.
//  Copyright (c) 2015 Nakib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    //keeping track if user is in middle of typing
    var userIsTyping = false;
    
    //append number to display screen
    @IBAction func appendNumber(sender: UIButton) {
        //get user pressed number
        let digit = sender.currentTitle!
        
        //if user is in middle of typing append digit or set display value to one entered
        if(userIsTyping){
            display.text = display.text! + digit
        }
        else{
            display.text = digit
            userIsTyping = true
        }
       
        print(digit);
    }
    
    //stack to hold user inputed values
    var operandStack = Array<Double>()
    
    //Adding value to stack on pressing return
    @IBAction func enter() {
        userIsTyping = false
        operandStack.append(displayValue)
        print(operandStack);
    }
    
    var displayValue:Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        
        set{
            display.text = "\(newValue)"
            userIsTyping = false
        }
    }
}

