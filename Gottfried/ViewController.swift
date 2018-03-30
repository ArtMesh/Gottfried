//
//  ViewController.swift
//  Gottfried
//
//  Created by ArtMesh on 3/24/18.
//  Copyright © 2018 ArtMesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        
    let alert = UIAlertController(title: "Warning", message: "Division by 0 ! Values will be reset.", preferredStyle: UIAlertControllerStyle.alert)
        
    alert.addAction(UIAlertAction(title:"OK", style:.default, handler: nil))
        
    self.present(alert, animated:true,completion: nil)
        
    }
    
    @IBOutlet weak var inputLabel: UILabel!

    var numFirst: Double = 0
    var numSecond: Double = 0
    var result: Double = 0
    var typeOperation: String = ""
    
    var inputIsEmpty = true
    var haveDot = false

    
    var input: Double? {
        get{
    
           return Double(inputLabel.text!)!
            
        }
        set{

            inputLabel.text = "\(String(describing: newValue))"
            inputIsEmpty = true
        }
    }
     
    @IBAction func addNumber(_ number: UIButton) {
        
        let symbol = number.currentTitle!
        
            
        if inputIsEmpty{
                
            inputLabel.text = symbol
            inputIsEmpty = false
                
        } else {
            if ((inputLabel.text?.characters.count)! < 15){
            inputLabel.text = inputLabel.text! + symbol
            }
        }
    }
    
    @IBAction func pushOperation(_ operation: UIButton) {
        
        typeOperation = operation.currentTitle!
        
        numFirst = input!
        inputIsEmpty = true
        haveDot = false

    }
   
    @IBAction func pushEquals(_ sender: UIButton) {
        
        if inputIsEmpty != true{
            numSecond = input!
        }
        
        haveDot = false
        
        switch typeOperation {
            case "+":
                result = numFirst + numSecond
            case "-":
                result = numFirst - numSecond
            case "*":
                result = numFirst * numSecond
            case "/":
		if (numSecond == 0){
			showAlert()
			pushCancel(sender)			
		} else {
		result = numFirst / numSecond
		}
        
            default:
                break
        }
        inputLabel.text = String (result)
        inputIsEmpty = true
    }
    
    @IBAction func pushCancel(_ sender: UIButton) {
        numSecond = 0
        numFirst = 0
        inputIsEmpty = true
        result = 0
        inputLabel.text = "0"
        typeOperation = ""
        haveDot = false
    }
    @IBAction func pushDot(_ sender: UIButton) {
        if haveDot != true && inputIsEmpty != true {
            inputLabel.text = inputLabel.text! + "."
            haveDot = true
        } else if haveDot != true && inputIsEmpty == true {
            inputLabel.text = "0."
            haveDot = true
        }
    }
    
    @IBAction func pushSquare(_ sender: UIButton) {
        input! = input!*input!
    }
    
    @IBAction func pushSign(_ sender: UIButton) {
        input! = -input!
    }
    
}
