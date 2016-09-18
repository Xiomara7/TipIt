//
//  SettingsViewController.swift
//  tipIt
//
//  Created by Xiomara on 9/16/16.
//  Copyright © 2016 Xiomara. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var incrementTipButton: UIButton!
    @IBOutlet weak var decrementTipButton: UIButton!
    @IBOutlet weak var tipPercentage: UILabel!
    
    var storedValues = NSUserDefaults.standardUserDefaults()
    
    let tipKey = "currentPercentage"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set initial value from tip percentage
        let currentPercentage = storedValues.valueForKey(tipKey) as! Int
        showAndSavePercentage(currentPercentage)
    }
    
    @IBAction func incrementTipButtonTapped(sender: AnyObject) {
        
        var currentPercentage = storedValues.valueForKey(tipKey) as! Int
        
        if currentPercentage < 99 {
            currentPercentage += 5
            
            showAndSavePercentage(currentPercentage)
        }
    }
    
    @IBAction func decrementTipButtonTapped(sender: AnyObject) {
        
        var currentPercentage = storedValues.valueForKey(tipKey) as! Int
        
        if currentPercentage > 5 {
            currentPercentage -= 5
            
            showAndSavePercentage(currentPercentage)
        }
        
    }
    
    func showAndSavePercentage(percentage: Int) {
        tipPercentage.text = "\(percentage)"
        
        storedValues.setValue(percentage, forKey: tipKey)
        storedValues.synchronize()
    }
    
}
