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
        
    }
    
    @IBAction func addGreenComponent (_ sender: Any) {
    }
    
    @IBAction func addBlueComponent (_ sender: Any) {
    }
    
}

// MARK: color change method
extension ViewController {
    private func changeColorSettings (color: rgbColors,
                                      volume: CGFloat
                                     ) {
        switch color {
        case .red:   redVolume   = volume
        case .green: greenVolume = volume
        case .blue:  blueVolume  = volume
        }
        
        
    }
    
    private func changeViewColor () {
        colorPlace.backgroundColor = UIColor(red:   redVolume,
                                             green: greenVolume,
                                             blue:  blueVolume,
                                             alpha: 1
                                            )
    }
}


//MARK: labels change method
extension ViewController {
    
}
