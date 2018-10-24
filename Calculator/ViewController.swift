//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController : UIViewController
{
  // MARK: - Attributes
  @IBOutlet weak var displayLabel: UILabel!
  private var isFinishedTypingNumber = true
  private var calcLogic = CalculatorLogic()

  let decimalFormatter : NumberFormatter =
  {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter
  }()

  private var displayValue: Double
  {
    get { return Double(displayLabel.text!)! }
    set { displayLabel.text = decimalFormatter.string(for: newValue) }
  }

  // MARK: -

  @IBAction func calcButtonPressed(_ sender: UIButton)
  {
    // What should happen when a non-number button is pressed
    isFinishedTypingNumber = true
    calcLogic.setNumber(displayValue)

    if let calcOperation = sender.currentTitle,
       let result = calcLogic.calculate(symbol: calcOperation)
    {
      displayValue = result
    }
  }

  @IBAction func numButtonPressed(_ sender: UIButton)
  {
    // What should happen when a number is entered into the keypad
    if let numValue = sender.currentTitle
    {
      if isFinishedTypingNumber
      {
        if numValue != "."
        {
          displayLabel.text = numValue
        }
        else
        {
//          if calcLogic.operation != nil
//          {
//            displayValue = 0
//          }
          displayLabel.text! += numValue
        }
        isFinishedTypingNumber = false
      }
      else
      {
        if numValue == ".",
           displayLabel.text?.firstIndex(of: ".") != nil
        {
          return
        }

        displayLabel.text! += numValue
      }
    }
  }
}
