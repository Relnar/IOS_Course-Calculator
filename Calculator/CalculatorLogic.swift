//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Pierre-Luc Bruyere on 2018-10-22.
//  Copyright © 2018 Heather productions. All rights reserved.
//

import Foundation

struct CalculatorLogic
{
  // MARK: - Attributes
  private var number: Double?
  private var intermediateCalculation : (n1: Double, calcMethod: String)?

  // MARK: -
  mutating func setNumber(_ number: Double)
  {
    self.number = number
  }

  mutating func calculate(symbol: String) -> Double?
  {
    if let n = number
    {
      switch symbol
      {
        case "AC":
          return 0
        case "+/-":
          return n * -1
        case "%":
          return n / 100.0
        case "=":
          return performTwoNumCalculation(n2: n)
        default:
          intermediateCalculation = (n1: n, calcMethod: symbol)
      }
    }
    return nil
  }

  private func performTwoNumCalculation(n2: Double) -> Double?
  {
    if let n1 = intermediateCalculation?.n1,
       let operation = intermediateCalculation?.calcMethod
    {
      switch operation
      {
        case "÷":
          if (n1 != 0.0)
          {
            return n2 / n1
          }
        case "×":
          return n1 * n2
        case "-":
          return n1 - n2
        case "+":
          return n1 + n2
        default:
          return nil
      }
    }
    return nil
  }
//  func calculate(symbol: String, value: Double) -> Double?
//  {
//    switch symbol
//    {
//    case "AC":
//      isFinishedTypingNumber = true
//      number = 0
//      operation = nil
//    case "+/-":
//      number *= -1.0
//    case "%":
//      number /= 100.0
//    case "÷","×","-","+","=":
//      if symbol == "="
//      {
//        if let op = operation
//        {
//          switch op
//          {
//          case "÷":
//            if (value != 0.0)
//            {
//              number = Double(number) / value
//            }
//            else
//            {
//              return nil
//            }
//          case "×":
//            number = Double(number) * value
//          case "-":
//            number = Double(number) - value
//          case "+":
//            number = Double(number) + value
//          default:
//            print("Error")
//          }
//        }
//      }
//      else
//      {
//        operation = symbol
//        isFinishedTypingNumber = true
//        number = value
//      }
//    default:
//      print("Error")
//    }
//
//    return number
//  }
}
