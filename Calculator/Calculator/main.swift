//
//  main.swift
//  Calculator
//
//  Created by Alex Paul on 10/25/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

var typeOfCalculation = false
var enterOperation = true
var makeAChoice = true
var condition = true
 var opString = ["+", "-", "/", "*"].randomElement() ?? "%"
var randomOperator = ""

HigherOrderLoop: repeat {
    print("Enter type of calculation, 1 (regular), 2 (high order)?")
    var userInput = readLine() ?? "5 + %"
    
    switch userInput {
    case "1":
        print("Enter your operation, e.g 5 + 3")
        userInput = readLine() ?? ""
        enterOperation = true
        //typeOfCalculation = true
    //continue
    case "2":
        enterOperation = false
        typeOfCalculation = true
    // continue HigherOrderLoop
    default:
        print("Enter valid input")
    }
    
    
    
    
    
    func mathStuffFactory(opString: String) -> (Double, Double) -> Double {
         
        var opString = opString
      
        if opString == "?" {
            
            opString = ["+", "-", "/", "*"].randomElement() ?? "%"
        }
        
        randomOperator = opString

        
        switch opString {
        case "+":
            return {x, y in x + y }
        case "-":
            return {x, y in x - y }
        case "*":
            return {x, y in x * y }
        case "/":
            return {x, y in x / y }
        default:
            return {x, y in x + y }
        }
    }
    
   
    print()
    
    
    func takeInInput(input: String) -> Double {
        
        let userInputAsArray = input.components(separatedBy: " ")
        
        let mathFunction = mathStuffFactory(opString: userInputAsArray[1])
    
        let num1 = Double(userInputAsArray[0]) ?? 0.0
        
        let num2 = Double(userInputAsArray[2]) ?? 0.0
        
        //let equal = ""
        
        let calcu = mathFunction(num1,num2)
        
        return calcu
        
    }
    
    print(takeInInput(input: userInput))
    
    print("Guess the operation sign? Type: +, -, /, *")
    print("opString: \(randomOperator)")
    
     repeat {
      
        var userInput2 = readLine() ?? "0"
      
        if userInput2 == randomOperator {
         
            print("Correct")
            condition = false
                      
        } else {
            print("Take another guess")
            condition = true
            
        }
  
    } while condition == true

   
    repeat {
        print("Calculate again? Type Yes or No")
        let answer = readLine()?.lowercased() ?? ""
        switch answer {
        case "yes":
            print("yes")
            enterOperation = true
            makeAChoice = false
        case "no":
            print("No")
            enterOperation = false
            makeAChoice = false
        default:
            print("Enter Yes or No, please!")
        }
        
    } while makeAChoice
    
} while enterOperation


