//
//  ViewController.swift
//  tipIt
//
//  Created by Xiomara on 9/16/16.
//  Copyright © 2016 Xiomara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    
    let tipKey = "currentPercentage"
    var currentPercentage: Int!
    
    var storedValues = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.adjustsFontSizeToFitWidth = true
        totalLabel.adjustsFontSizeToFitWidth = true
        
        // Set initial value from tip percentage
        currentPercentage = 15
        
        storedValues.setValue(currentPercentage, forKey: tipKey)
        storedValues.synchronize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        billField.becomeFirstResponder()
        
        currentPercentage = storedValues.valueForKey(tipKey) as! Int
        calculateTip(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        
        let bill = Double(billField.text!) ?? 0
        
        let percentage = Double(currentPercentage) / 100
        let tip = bill * percentage ?? 0
        
        let total = bill + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
    }
}

