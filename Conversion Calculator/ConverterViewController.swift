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
    
    
    // Start conversion functions
    func CelsToFahr(_ celc: String) -> String {
        let convertToFahr: Double = Double(celc)!
        let cTf = (convertToFahr * (9/5)) + 32
        return String(cTf) + "°F"
    }
    
    func fahrToCelc (_ fahr: String) -> String {
        let convertToCelc: Double = Double(fahr)!
        let fTc = (convertToCelc - 32) * (5/9)
        return String(fTc) + "°C"
    }

    func mileToKilo(_ mile: String) -> String {
        let convertMileToKilo: Double = Double(mile)!
        let mTk = convertMileToKilo * 1.60934
        return String(mTk) + "km"
    }
    
    func kiloToMile (_ kilo: String) -> String {
        let convertKiloToMile: Double = Double(kilo)!
        let kTm = convertKiloToMile * 0.621371
        return String(kTm) + "mi"
    }
    //End conversion functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func digits(_ sender: UIButton) {
        
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
    
    
    var InputNum = ["\u{00B0}F","\u{00B0}C","mi","km"]
    
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: ACTIONS
    
    @IBAction func clickButton(_ sender: Any) {
    }
}
