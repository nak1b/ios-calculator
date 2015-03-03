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
       
        //print(digit);
    }
    
    //stack to hold user inputed values
    var operandStack = Array<Double>()
    
    //Adding value to stack on pressing return
    @IBAction func enter() {
        userIsTyping = false
        operandStack.append(displayValue)
        print("Operand Stack:  + \(operandStack) \n");
    }
    
    //Determining the operator and doing appropriate operation
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        
        //if user is typing and press operator instead of enter key add it to the stack
        if(userIsTyping){
            enter();
        }
        
        //performing operation based on users input
        switch operation{
            case "×": performOperation{$0 * $1}
            case "÷": performOperation{$1 / $0}
            case "+": performOperation{$0 + $1}
            case "−": performOperation{$1 - $0}
            default: break
        }
    }
    
    //performing operation based on function provided
    func performOperation(operation:(Double, Double)->Double){
        if(operandStack.count>=2){
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
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

