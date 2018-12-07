//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Zac Johnson on 10/25/18.
//  Copyright © 2018 ZacJohnson. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    //converter choice variable
    var choice: Int = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //digit function. Press numbers to add to number
    @IBAction func numberPressed(_ sender: UIButton) {
        inputDisplay.text = inputDisplay.text! + String(sender.tag-1)
        
        switch choice {
        case 1:
            outputDisplay.text = CelsToFahr(inputDisplay.text!)
        case 2:
            outputDisplay.text = fahrToCelc(inputDisplay.text!)
        case 3:
            outputDisplay.text = kiloToMile(inputDisplay.text!)
        case 4:
            outputDisplay.text = mileToKilo(inputDisplay.text!)
        default:
            outputDisplay.text = CelsToFahr(inputDisplay.text!)
        }
        
    }
    
    //make input number positive or negative. Must enter another number for it to calculate
    @IBAction func positiveOrNegative(_ sender: UIButton) {
        if (inputDisplay.text?.contains("-"))! {
            inputDisplay.text = inputDisplay.text?.replacingOccurrences(of: "-", with: "")
            
        } else {
            inputDisplay.text = "-" + inputDisplay.text!
        }
    }
    
    //Adds decimal point to input. will add 0. if no input is present
    @IBAction func dicimalPoint(_ sender: UIButton) {
        if (inputDisplay.text?.contains("."))! {
            return
        }
        
        if (inputDisplay.text?.isEmpty)! {
            inputDisplay.text = inputDisplay.text! + "0."
        }
        else {
            inputDisplay.text = inputDisplay.text! + "."
        }
    }
    
    //clears both input and ouput
    @IBAction func clear(_ sender: UIButton) {
        inputDisplay.text = ""
        outputDisplay.text = ""
    }
    
    //Display outlets
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    // Start conversion functions
    func CelsToFahr(_ celc: String) -> String {
        let convertToFahr: Double = Double(celc)!
        let cTf = (convertToFahr - 32) * (5/9)
        return String(cTf) + "°C"
    }
    
    func fahrToCelc (_ fahr: String) -> String {
        let convertToCelc: Double = Double(fahr)!
        let fTc = (convertToCelc * (9/5)) + 32
        return String(fTc) + "°F"
    }
    
    func mileToKilo(_ mile: String) -> String {
        let convertMileToKilo: Double = Double(mile)!
        let mTk = convertMileToKilo * 0.621371
        return String(mTk) + "mi"
    }
    
    func kiloToMile (_ kilo: String) -> String {
        let convertKiloToMile: Double = Double(kilo)!
        let kTm = convertKiloToMile / 0.621371
        return String(kTm) + "km"
    }
    //End conversion functions
    
    //convert button start
    @IBAction func convert(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Converter", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "fahrenheit to celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.choice = 1
            self.inputDisplay.text = ""
            self.outputDisplay.text = ""
        }))
        
        alert.addAction(UIAlertAction(title: "celcius to fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.choice = 2
            self.inputDisplay.text = ""
            self.outputDisplay.text = ""
        }))
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.choice = 3
            self.inputDisplay.text = ""
            self.outputDisplay.text = ""
            
        }))
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.choice = 4
            self.inputDisplay.text = ""
            self.outputDisplay.text = ""
        }))
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    //convert button end

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: ACTIONS
    
}
