//
//  CalcViewController.swift
//  ConversionCalc
//
//  Created by Henry McMurray on 11/1/19.
//  Copyright © 2019 Henry McMurray. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var outputUnit: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    @IBOutlet weak var inputUnit: UITextField!
    
    var mode = 1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var conversion: [converter] = []
        conversion.append(converter(labels: "Fahrenheit to Celcius", inputs: "°F", outputs: "°C"))
        conversion.append(converter(labels: "Celcius to Fahrenheit", inputs: "°C", outputs: "°F"))
        conversion.append(converter(labels: "Miles to Kilometers", inputs: "mi", outputs: "km"))
        conversion.append(converter(labels: "Kilometers to Miles", inputs: "km", outputs: "mi"))

        // Do any additional setup after loading the view.
    }
    @IBAction func convert(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Converter", preferredStyle: .actionSheet)

        //let firstAction = UIAlertAction(title: conversion[0].label, style: .default)
        let firstAction = UIAlertAction(title: "Fahrenheit to Celcius", style: .default, handler: {
            (alertAction) -> Void in
            self.mode = 1
            self.clearT()
        })
        let secondAction = UIAlertAction(title: "Celcius to Fahrenheit", style: .default, handler: {
            (alertAction) -> Void in
            self.mode = 2
            self.clearT()
        })
        let thirdAction = UIAlertAction(title: "Miles to Kilometers", style: .default, handler: {
            (alertAction) -> Void in
            self.mode = 3
            self.clearT()
        })
        let fourthAction = UIAlertAction(title: "Kilometers to Miles", style: .default, handler: {
            (alertAction) -> Void in
            self.mode = 4
            self.clearT()
        })

        optionMenu.addAction(firstAction)
        optionMenu.addAction(secondAction)
        optionMenu.addAction(thirdAction)
        optionMenu.addAction(fourthAction)

        self.present(optionMenu, animated: true, completion: nil)

    }
    @IBAction func nums(_ sender: UIButton){
        var numHolder = ""
        numHolder = numHolder + String(sender.tag-1)
        inputDisplay.text = inputDisplay.text! + numHolder

        if self.inputUnit.text == "°F" {
            let numb = Double(self.inputDisplay.text!)
            let result = ((numb! - 32) * 5/9)
            self.outputDisplay.text = String(result)
        }
        if self.inputUnit.text == "°C" {
            let numb = Double(self.inputDisplay.text!)
            let result = ((numb! * 9/5) + 32)
            self.outputDisplay.text = String(result)
        }
        if self.inputUnit.text == "mi"{
            let numb = Double(self.inputDisplay.text!)
            let result = (numb! * 1.609344)
            self.outputDisplay.text = String(result)
        }
        if self.inputUnit.text == "km"{
            let numb = Double(self.inputDisplay.text!)
            let result = (numb! / 1.609344)
            self.outputDisplay.text = String(result)
        }
    }
    @IBAction func neg(_ sender: UIButton){
        inputDisplay.text = "-" + inputDisplay.text!

    }
    @IBAction func dec(){
        inputDisplay.text = inputDisplay.text! + "."
    }
    @IBAction func clearT(){
        inputDisplay.text = ""
        outputDisplay.text = ""
        setCon()
    }
    func setCon(){
        switch mode{
            case 1:
                inputUnit.text = "°F"
                outputUnit.text = "°C"
            case 2:
                inputUnit.text = "°C"
                outputUnit.text = "°F"
            case 3:
                inputUnit.text = "mi"
                outputUnit.text = "km"
            case 4:
                inputUnit.text = "km"
                outputUnit.text = "mi"
        default :
            inputUnit.text = "°F"
            outputUnit.text = "°C"
        }
    }
    struct converter{
        var label: String
        var input: String
        var output: String

        init(labels:String, inputs:String, outputs:String){
            self.label = labels
            self.input = inputs
            self.output = outputs
        }
    }

}
