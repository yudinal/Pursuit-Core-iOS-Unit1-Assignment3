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
var allOperations = ["+", "-", "/", "*" ]
var allOperationss = ["x+y", "x-y", "x*y","x/y"]
var randomElements = allOperationss.randomElement() ?? ""
var randomElement = allOperations.randomElement() ?? ""
var condition = true // condition not to crash when press enter


HigherOrderLoop: repeat {
    print("Enter type of calculation, 1 (regular), 2 (high order)?")
    var userInput = readLine() ?? "5 + %"
    
    //     let userInput = readLine() ?? "$ + 5"
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
        
        var opString = opString // want to make opString mutable
        
        if opString == "?" {
            opString = ["+", "-", "/", "*"].randomElement() ?? "*"
        }
        
        switch opString {
        case "+":
            return {x, y in x + y }
        case "-":
            return {x, y in x - y }
        case "*":
            return {x, y in x * y }
        case "/":
            return {x, y in x / y }
            //case "?":
        //  return {x, y in allOperationss }
        default:
            return {x, y in x + y }
        }
    }
    
    //let mathFunction = mathStuffFactory(opString: Array[])
    //let UserInput = readLine() ?? "5 + 5"
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
    
    func questionMark(input: String) -> Double {
        let userInputAsArray = input.components(separatedBy: " ")
        //let input = "?"
        let mathFunction = mathStuffFactory(opString: userInputAsArray[1])
        // if opString = "?" {
        //   let mathFunction = randomElement
        // }
        let num1 = Double(userInputAsArray[0]) ?? 0.0
        let num2 = Double(userInputAsArray[2]) ?? 0.0
        let calcu = mathFunction(num1,num2)
        // if opString = "?" {
        //        for (userInputAsArray) in randomElements {
        //            if input = "?" {
        //                return randomElements //  dashes[index] = Character(userInput)
        //                func applyKTimes (_ K: Int, closure: () -> ()) {
        //                    for _ in 1...K {
        //                        closure()
        //                    }
        //                }
        //            }
        //        }
        return calcu
    }
    
    
    
    //        if randomElement.contains(userInput) {
    //            print("Correct")
    //        } else {
    //            print("Wrong. Take another guess.")
    //            condition false
    //        } while condition
    //
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

//let calcu = mathFunction(10,5)
//print("your calculation is \(calcu)")

// 5 + 5

// 10
