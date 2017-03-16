//
//  ViewController.swift
//  Tip Calculator
//
//  Created by auto on 3/10/17.
//  Copyright © 2017 Silpa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
        
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTipControlKey")
        calculateTip(billField)
        
        
        // Animation Block
        self.tipLabel.alpha = 0
        self.totalLabel.alpha = 0
        UIView.animate(withDuration: 0.6, animations: {
            self.tipLabel.alpha = 1
            self.totalLabel.alpha = 1
        })
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let billAmount = Double(billField.text!) ?? 0
        let tipAmount = billAmount * tipPercentages[tipControl.selectedSegmentIndex]
        let total = billAmount + tipAmount
        
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", total)
        }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}

