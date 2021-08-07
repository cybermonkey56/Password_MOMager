//
//  ViewController.swift
//  RandomPassword
//
//  Created by apple on 3/15/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    
    @IBOutlet weak var GenOutlet: UIButton!
    @IBOutlet weak var NumSlider: UISlider!
    @IBOutlet weak var ch: UILabel!
    @IBOutlet weak var RamdomNumText: UITextView!
    @IBOutlet weak var viewsNumSlider: UIView!
    @IBOutlet weak var showView: UIView!
    @IBOutlet weak var numview: UIView!
    @IBOutlet weak var letterview: UIView!
    @IBOutlet weak var numberswitchOutlet: UISwitch!
    @IBOutlet weak var letterswitchOutlet: UISwitch!
    
    var num = 0
    var isnumberOk = true
    var isletterOk = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //RamNumberText.text = randomString(length: 20)
        RamdomNumText.text = "Password will show here!"
        //        numberswitchOutlet.setOn(false, animated:true)
        //        letterswitchOutlet.setOn(false, animated: true)
        
        
    }
    
    @IBAction func start(_ sender: UIButton) {
    
    func editView() {
        GenOutlet.layer.cornerRadius = 6
        viewsNumSlider.layer.cornerRadius = 6
        showView.layer.cornerRadius = 6
        numview.layer.cornerRadius = 6
        letterview.layer.cornerRadius = 6
        
    }
    
    func randomString(length: Int) -> String {
        var letters = ""
        if isnumberOk == true && isletterOk == true {
            letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        } else if isletterOk == true && isnumberOk == false{
            letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        } else if isletterOk == false && isnumberOk == true{
            letters = "0123456789"
        }
        
        return String((0..<length).map{ _ in
            letters.randomElement()! })
    }
    
    
        func NumBerSlider(_ sender: UISlider) {
        
        let value = NumSlider.value
        
        num = Int(value)
        ch.text = String(num)
        
        if numberswitchOutlet.isOn == false && letterswitchOutlet.isOn == false{
            RamdomNumText.text = "Number & letter switch off"
            sender.isEnabled = false
            
        } else{
            sender.isEnabled = true
            RamdomNumText.text = randomString(length: num)
        }
    }
    
        func GenAction(_ sender: UIButton) {
        if numberswitchOutlet.isOn == false && letterswitchOutlet.isOn == false{
            RamdomNumText.text = "Number & letter switch off"
        } else{
            RamdomNumText.text = randomString(length: num)
        }
        
        
    }
    
        func numberSwitch(_ sender: UISwitch) {
        if numberswitchOutlet.isOn {
            isnumberOk = true
        } else{
            isnumberOk = false
        }
    }
    
        func letterSwitch(_ sender: UISwitch) {
        if letterswitchOutlet.isOn {
            isletterOk = true
        } else{
            isletterOk = false
        }
    }
}

}
