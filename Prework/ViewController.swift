//
//  ViewController.swift
//  Prework
//
//  Created by Gustavo Cornejo on 8/25/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    //Extra features
    @IBOutlet weak var otherTip: UITextField!
    @IBOutlet weak var applyOtherPercentButton: UIButton!
    @IBOutlet weak var numberOfPeople: UISegmentedControl!
    @IBOutlet weak var tipPerPerson: UILabel!
    @IBOutlet weak var totalPerPerson: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        //get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        let otherTip = Double(otherTip.text!) ?? 0

        var tip = 0.0
        let tipPercentages = [0.15, 0.18, 0.2]
        if(otherTip != 0){
            let newPercentage =  otherTip / 100
            tip = bill * newPercentage
        } else {
            tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        }
        let total = bill + tip
        let splitTip = tip / Double(numberOfPeople.selectedSegmentIndex + 1)
        let splitTotal = total / Double(numberOfPeople.selectedSegmentIndex + 1)
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        tipPerPerson.text = String(format: "$%.2f", splitTip)
        totalPerPerson.text = String(format: "$%.2f", splitTotal)
    }

}

