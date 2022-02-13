//
//  ViewController.swift
//  Colorimeter
//
//  Created by Георгий Кузнецов on 13.01.2022.
//

import UIKit

protocol ColoredVCDelegate {
    func getColors(red: Float, green: Float, blue: Float)
}
class ViewController: UIViewController {

    @IBOutlet weak var colorPlace: UIView!
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    var redVolume: Float = 0.7
    var greenVolume: Float = 0.7
    var blueVolume: Float = 0.7

    
    private enum rgbColors {
        case red, green, blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        redTextField.text = String(redVolume)
        greenTextField.text = String(greenVolume)
        blueTextField.text = String(blueVolume)
        
        changeColorSettings(color: .red, volume: redVolume)
        changeColorSettings(color: .green, volume: greenVolume)
        changeColorSettings(color: .blue, volume: blueVolume)
                                            
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

// MARK: color and label value changing method
extension ViewController {
    private func changeColorSettings (color: rgbColors,
                                      volume: Float
                                     ) {
        switch color {
        case .red:
            redVolume = volume
            redValue.text = "\(String(format: "%.2f", volume))"
            redTextField.text = redValue.text
            redSlider.value = Float(volume)
        case .green:
            greenVolume = volume
            greenValue.text = "\(String(format: "%.2f", volume))"
            greenTextField.text = greenValue.text
            greenSlider.value = Float(volume)
        case .blue:
            blueVolume = volume
            blueValue.text = "\(String(format: "%.2f", volume))"
            blueTextField.text = blueValue.text
            blueSlider.value = Float(volume)
        }
        
        changeViewColor()
    }
    
    private func changeViewColor () {
        colorPlace.backgroundColor = UIColor(red:   CGFloat(redVolume),
                                             green: CGFloat(greenVolume),
                                             blue:  CGFloat(blueVolume),
                                             alpha: 1
                                            )
    }
}

// MARK: work with textFields
extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case redTextField:
            guard let text = redTextField.text else { return }
            changeColorSettings(color: .red, volume: Float(text) ?? 0.5)
            //довольно странная конструкция, но только она не вызывала у меня ошибок.
            // подобный вариант где-то на просторах интернета нашел.
        case greenTextField:
            guard let text = greenTextField.text else { return }
            changeColorSettings(color: .green, volume: Float(text) ?? 0.5)
        case blueTextField:
            guard let text = blueTextField.text else { return }
            changeColorSettings(color: .blue, volume: Float(text) ?? 0.5)
        default:
            print("Надеюсь, мы никогда не увидим это сообщение")
        }
    }
}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let coloredVC = segue.destination as? ColoredViewController else { return }
        coloredVC.delegate = self
        coloredVC.redValue = Float(redVolume)
        coloredVC.greenValue = Float(greenVolume)
        coloredVC.blueValue = Float(blueVolume)
    }
}

extension ViewController: ColoredVCDelegate {
    func getColors(red: Float, green: Float, blue: Float) {
         redVolume = red
         greenVolume = green
         blueVolume = blue

    }
    
    
}
