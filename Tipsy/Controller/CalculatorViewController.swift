//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit



class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLevel: UILabel!
    
    var tipString : String = "0"
    var peopleCounter : Int = 2
    var billAmount : Double = 0.0
    var totalCost : Double = 0.0
    var billSplit : Double = 0.0
    var tipBreakdown : String = " "
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        var tipSelection : String = "0"
        updateTipPercent() //wipes selections clear
        sender.isSelected = true //visibly selects the chosen tip button
        tipSelection = sender.currentTitle!//stores/overwrites the selected tip text
        tipString = String(tipSelection.dropLast(1))

    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        peopleCounter = Int(sender.value)
        splitNumberLevel.text = String(peopleCounter)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton){
        var tipDouble : Double = 0.1
        billAmount = Double(billTextField.text!)!
        tipDouble = Double(tipString)!/100.00
        
        totalCost = billAmount + (billAmount * tipDouble)
        billSplit = totalCost/Double(peopleCounter)
        
        print("the tip as a double is \(tipDouble)")
        print("the bill without tip is \(billAmount)")
        print("The total cost is \(totalCost)")
        print("the bill will be split \(splitNumberLevel.text!) ways")
        print("each person pays $\(billSplit)")
        
        tipBreakdown = "Split \(totalCost) bill by \(peopleCounter) people and add \(tipDouble) for tip"
        
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalText = billSplit
            destinationVC.summaryText = tipBreakdown
        }
        }
    
    func updateTipPercent(){
        //should clear tip selections
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
    }
}

