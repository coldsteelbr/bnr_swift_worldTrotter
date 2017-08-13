//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Ivanov on 7/30/17.
//  Copyright © 2017 Ivanov. All rights reserved.
//

import UIKit

class ConversionViewController:UIViewController{
    @IBOutlet var celciusLabel:UILabel!
    @IBOutlet var textField:UITextField!
    
    let numberFormatter:NSNumberFormatter = {
        let formatter = NSNumberFormatter();
        formatter.numberStyle = .DecimalStyle
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        return formatter
    }()
    
    var fahrenheitValue:Double?{
        didSet{
            updateCelciusLable()
        }
    }
    
    var celciusValue:Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        }
        else{
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view")
    }
    
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField){
        
        if let text = textField.text, value = Double(text){
            fahrenheitValue = value
        }
        else{
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject){
        textField.resignFirstResponder()
    }
    
    func updateCelciusLable(){
        if let value = celciusValue {
            celciusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else{
            celciusLabel.text = "???"
        }
    }
    
    func textField(textField: UITextField,
            shouldChangeCharactersInRange range: NSRange,
            replacementString string: String) -> Bool{
                
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        
        if existingTextHasDecimalSeparator != nil &&
           replacementTextHasDecimalSeparator != nil{
            return false
        }
        else{
            return true
        }
    }
    
}