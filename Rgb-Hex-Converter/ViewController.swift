//
//  ViewController.swift
//  Rgb-Hex-Converter
//
//  Created by saidkurt on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let buttonTitleRgbToHex : String = "Rgb- Hex Convert"
    private let buttonTitleHexToRgb : String = "Hex - Rgb Convert"
    private var selectedIndex : Int?
    private var selectedColorString : String?
    private var selectedColorValue : UIColor?
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var labelRed: UITextField!
    @IBOutlet weak var labedGreen: UITextField!
    @IBOutlet weak var labelBLue: UITextField!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var selectedColor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = segment.selectedSegmentIndex
    }
    
    
    @IBAction func buttonOnClick(_ sender: UIButton) {
        if selectedIndex == 0 {
            colorLabel.text = convertToRgbToHex().selectedColorString
            selectedColor.backgroundColor = convertToRgbToHex().selectedColorValue
        }else{
            colorLabel.text = converToHexToRgb().selectedColorString
            selectedColor.backgroundColor = converToHexToRgb().selectedColorValue
        }
    }
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        labelRed.text?.removeAll()
        labedGreen.text?.removeAll()
        labelBLue.text?.removeAll()
        colorLabel.text?.removeAll()
        selectedColor.backgroundColor = UIColor.white
        selectedIndex = segment.selectedSegmentIndex
        if selectedIndex == 0 {
            button.setTitle(buttonTitleRgbToHex, for: UIControl.State.normal)
            
        }else{
            button.setTitle(buttonTitleHexToRgb, for: UIControl.State.normal)
        }
        
    }
    
    func convertToRgbToHex() ->(selectedColorString : String,selectedColorValue : UIColor){
        
        guard let redValue = UInt8(labelRed.text!) else {return ("",UIColor.white)}
        guard let greenValue = UInt8(labedGreen.text!) else {return ("",UIColor.white)}
        guard let blueValue  = UInt8(labelBLue.text!) else {return ("",UIColor.white)}
        
        selectedColorString = "Hex Color #\(String(format: "%2X", redValue)) \(String(format: "%2X", greenValue)) \(String(format: "%2X", blueValue))"
        selectedColorValue = UIColor(red: CGFloat(redValue) / 255, green: CGFloat(greenValue) / 255, blue: CGFloat(blueValue) / 255, alpha: 1)
        return (selectedColorString ?? "",selectedColorValue ?? UIColor.white)
    }
    
    
    
    func converToHexToRgb() ->(selectedColorString : String , selectedColorValue : UIColor){
        
        guard let redValue = UInt8(labelRed.text! ,radix: 16) else {return ("",UIColor.white)}
        guard let greenValue = UInt8(labedGreen.text!, radix: 16) else {return ("",UIColor.white)}
        guard let blueValue  = UInt8(labelBLue.text!, radix: 16) else {return ("",UIColor.white)}
        selectedColorString = "Red: \(redValue) Green :\(greenValue)  Blue : \(blueValue)"
        selectedColorValue = UIColor(red: CGFloat(redValue) / 255, green: CGFloat(greenValue) / 255, blue:CGFloat(blueValue) / 255, alpha: 1)
        return (selectedColorString ?? "",selectedColorValue ?? UIColor.white)
        
        
    }
}

