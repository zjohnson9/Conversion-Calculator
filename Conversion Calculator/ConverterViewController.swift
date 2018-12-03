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
        
    }
    
    @IBAction func changers(_ sender: UIButton) {
        
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
