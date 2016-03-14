//
//  ViewController.swift
//  TipCalc
//
//  Created by Khalili, Ani on 3/11/16.
//  Copyright © 2016 Khalili, Ani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
   
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var lblServiceLevel: UILabel!
    @IBOutlet weak var lblDisplayTip: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var lblDisplayTotalTip: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stepper.autorepeat = true
        stepper.maximumValue = 10
        stepper.minimumValue = 1

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeServiceQuality(sender: UIStepper) {
        
        self.lblServiceLevel.text = Int(sender.value).description
        var levelOfService = Int(lblServiceLevel.text!)
        
        switch levelOfService!
        {
            case 1,2,3: self.lblDisplayTip.text = "10 %"
            case 4,5: self.lblDisplayTip.text = "13 %"
            case 6,7: self.lblDisplayTip.text = "15 %"
            case 8,9: self.lblDisplayTip.text = "20 %"
            case 10: self.lblDisplayTip.text = "25 %"
            default: self.lblDisplayTip.text = "15 %"
  
        }
        
    }
    
    @IBAction func calculate(sender: UIButton) {
        var mapServiceToTip : [Int: Double] = [1: 0.1, 2: 0.10, 3: 0.2, 4: 0.13, 5: 0.13, 6: 0.15, 7: 0.15, 8: 0.2, 9: 0.2, 10: 0.25]
        
        var idx = Int(self.lblServiceLevel.text!)
        var percent: Double? = mapServiceToTip[idx!]
        let price: Double? = Double(self.txtPrice.text!)
        
        if(price != nil)
        {
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .CurrencyStyle
            formatter.locale = NSLocale.currentLocale()
            //formatter.stringFromNumber(price!)
            
            var calc = price! * percent!
            //self.lblDisplayTotalTip.text = String(calc)
            self.lblDisplayTotalTip.text = formatter.stringFromNumber(calc)
        }
        
        
    }

}

