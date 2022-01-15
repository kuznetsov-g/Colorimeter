//
//  ViewController.swift
//  Colorimeter
//
//  Created by Георгий Кузнецов on 13.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorPlace: UIView!
    @IBOutlet weak var redValue:   UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue:  UILabel!
    
    @IBOutlet weak var redSlider:   UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider:  UISlider!
    
    private var redVolume   = 0.5
    private var greenVolume = 0.5
    private var blueVolume  = 0.5
    /*просите, что выровнял опять
      не могу смотреть на неровные параметры)
      привычка с работы
    */
    
    private enum rgbColors {
        case red, green, blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeViewColor()
                                            
    }


    @IBAction func addRedComponent (_ sender: Any) {
        changeColorSettings(color: .red, volume: redSlider.value)
    }
    
    @IBAction func addGreenComponent (_ sender: Any) {
        changeColorSettings(color: .green, volume: greenSlider.value)
    }
    
    @IBAction func addBlueComponent (_ sender: Any) {
        changeColorSettings(color: .blue, volume: blueSlider.value)
    }
    
}

// MARK: color and label value change method
extension ViewController {
    private func changeColorSettings (color: rgbColors,
                                      volume: Float
                                     ) {
        switch color {
        case .red:
            redVolume = CGFloat(volume)
            redValue.text = "\(String(format: "%.2f", volume))"
        case .green:
            greenVolume = CGFloat(volume)
            greenValue.text = "\(String(format: "%.2f", volume))"
        case .blue:
            blueVolume = CGFloat(volume)
            blueValue.text = "\(String(format: "%.2f", volume))"
        }
        
        changeViewColor()
    }
    
    private func changeViewColor () {
        colorPlace.backgroundColor = UIColor(red:   redVolume,
                                             green: greenVolume,
                                             blue:  blueVolume,
                                             alpha: 1
                                            )
    }
}

