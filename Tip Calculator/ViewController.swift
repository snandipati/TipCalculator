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
    @IBOutlet weak var twoPersonTotalLabel: UILabel!
    @IBOutlet weak var threePersonTotalLabel: UILabel!
    @IBOutlet weak var fourPersonTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Making bill filed the first responder
        billField.becomeFirstResponder()
    
        
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTipControlKey")
        let selectedThemeId = defaults.integer(forKey: "defaultThemeKey")
        updateTheme(selectedThemePosition: selectedThemeId)
        calculateTip(billField);
    }
    
    func updateTheme(selectedThemePosition: Int) {
        if(selectedThemePosition == 1) {
            //Set light color theme
            lightTheme()
        } else if(selectedThemePosition == 0) {
            //Set dark color theme
            darkTheme()
        }
    }
    
    func darkTheme() {
        //Main view
        self.view.backgroundColor = UIColor.darkGray
        self.view.tintColor = UIColor.orange
        tipLabel.textColor = UIColor.orange
        totalLabel.textColor = UIColor.orange
        twoPersonTotalLabel.textColor = UIColor.orange
        threePersonTotalLabel.textColor = UIColor.orange
        fourPersonTotalLabel.textColor = UIColor.orange
        billField.textColor = UIColor.orange
    }
    
    func lightTheme() {
        //Main view
        self.view.backgroundColor = UIColor.white
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
        let twoTotal = total/2
        let threeTotal = total/3
        let fourTotal = total/4
        
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", total)
        twoPersonTotalLabel.text = String(format: "$%.2f",twoTotal)
        threePersonTotalLabel.text = String(format: "$%.2f",threeTotal)
        fourPersonTotalLabel.text = String(format: "$%.2f",fourTotal)

}
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
         // Animation Block
        self.tipLabel.alpha = 0
        self.totalLabel.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.tipLabel.alpha = 1
            self.totalLabel.alpha = 1
        })
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}

