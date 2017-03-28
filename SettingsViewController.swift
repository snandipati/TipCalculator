//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by auto on 3/12/17.
//  Copyright © 2017 Silpa. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var themeControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        defaultSettings()
    }
    func defaultSettings() {
        defaultTheme()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
   
    func defaultTheme() {
        let defaults = UserDefaults.standard
        let selectedThemeId = defaults.integer(forKey: "defaultThemeKey")
        themeControl.selectedSegmentIndex = selectedThemeId
        updateTheme(selectedThemePosition: selectedThemeId)
    }
    
    //This function is used to update the theme based on selection by the user
    func updateTheme(selectedThemePosition: Int) {
        if(selectedThemePosition == 1) {
            //Set light color theme
            lightTheme()
        }
        else if(selectedThemePosition == 0) {
            //Set dark color theme
            darkTheme()
        }
    }
    
    //This function is used to load the dark theme
    func darkTheme() {
        //Main view
        self.view.backgroundColor = UIColor.darkGray
        self.view.tintColor = UIColor.orange
    }
    
    //This function is used to load the light theme
    func lightTheme() {
        //Main view
        self.view.backgroundColor = UIColor.white
        }

    
    
    @IBAction func setDefaultTipPercent(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTipControlKey")
            defaults.synchronize()
    }
    @IBAction func changeTheme(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(themeControl.selectedSegmentIndex, forKey: "defaultThemeKey")
        defaults.synchronize()
        //Reloading Settings page with new theme selection
        defaultSettings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        defaultTipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTipControlKey")
        themeControl.selectedSegmentIndex = defaults.integer(forKey: "defaultThemeKey")
        defaultTheme()
        
    }
    
}
