//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Zac Johnson on 10/25/18.
//  Copyright © 2018 ZacJohnson. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    var dot = false
    var choice: Int = 1
    var NewNum: String?
    var CurNum: String = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func digits(_ sender: UIButton) {
        NewNum = CurNum + String(sender.tag-1)
        CurNum = NewNum!
        inputDisplay.text = NewNum! + " " + inputTag[choice - 1]
        
        switch choice {
        case 1:
            outputDisplay.text = CelsToFahr(CurNum)
        
        case 2:
            outputDisplay.text = fahrToCelc(CurNum)
        
        case 3:
            outputDisplay.text = kiloToMile(CurNum)
        
        case 4:
            outputDisplay.text = mileToKilo(CurNum)
        
        default: outputDisplay.text = fahrToCelc(CurNum)
        }
    }
    
    
    @IBAction func positiveOrNegative(_ sender: UIButton) {
        if CurNum.contains("-") {
                CurNum.remove(at: CurNum.startIndex)
        } else {
            CurNum = "-" + CurNum
        }
    }
    
    
    @IBAction func dicimalPoint(_ sender: UIButton) {
        if CurNum.contains(".") {
            return
        }
        
        if CurNum.isEmpty {
            CurNum += "0."
        }
        else {
            CurNum += "."
        }
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
        self.CurNum.removeAll()
        self.NewNum?.removeAll()
        outputDisplay.text = ""
        inputDisplay.text = ""
    }
    
    
    var inputTag = ["\u{00B0}F","\u{00B0}C","mi","km"]
    
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
    
    
    @IBAction func convert(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Converter", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "fahrenheit to celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.choice = 1
            self.CurNum = ""
            self.inputDisplay.text = ""
            self.dot = false
            self.outputDisplay.text = ""
        }))
        
        alert.addAction(UIAlertAction(title: "celcius to fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.choice = 2
            self.inputDisplay.text = ""
            self.CurNum = ""
            self.dot = false
            self.outputDisplay.text = ""
        }))
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.choice = 3
            self.inputDisplay.text = ""
            self.CurNum = ""
            self.dot = false
            self.outputDisplay.text = ""
            
        }))
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.choice = 4
            self.inputDisplay.text = ""
            self.CurNum = ""
            self.dot = false
            self.outputDisplay.text = ""
        }))
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    

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
