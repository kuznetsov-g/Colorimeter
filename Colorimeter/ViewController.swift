//
//  ViewController.swift
//  Colorimeter
//
//  Created by Георгий Кузнецов on 13.01.2022.
//

import UIKit

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
    
    var redVolume: CGFloat = 0.7
    var greenVolume: CGFloat = 0.7
    var blueVolume: CGFloat = 0.7
    var delegate: ViewControllerDelegate!
    
    private enum rgbColors {
        case red, green, blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        redTextField.text = String(Float(redVolume))
        greenTextField.text = String(Float(greenVolume))
        blueTextField.text = String(Float(blueVolume))
        
        changeColorSettings(color: .red, volume: redVolume)
        changeColorSettings(color: .green, volume: greenVolume)
        changeColorSettings(color: .blue, volume: blueVolume)
                                            
    }
    @IBAction func tryButton(_ sender: Any) {
        guard let color = colorPlace.backgroundColor else { return }
        delegate.getColors(backgroundColor: color )
        dismiss(animated: true)
    }
    
    @IBAction func addRedComponent (_ sender: Any) {
        changeColorSettings(color: .red, volume: CGFloat(redSlider.value))
    }
    
    @IBAction func addGreenComponent (_ sender: Any) {
        changeColorSettings(color: .green, volume: CGFloat(greenSlider.value))
    }
    
    @IBAction func addBlueComponent (_ sender: Any) {
        changeColorSettings(color: .blue, volume: CGFloat(blueSlider.value))
    }
    
}


// MARK: color and label value changing method
extension ViewController {
    private func changeColorSettings(color: rgbColors,
                                     volume: CGFloat
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
            changeColorSettings(color: .red, volume: CGFloat(Float(text) ?? 0.5))
            //довольно странная конструкция, но только она не вызывала у меня ошибок.
            // подобный вариант где-то на просторах интернета нашел.
        case greenTextField:
            guard let text = greenTextField.text else { return }
            changeColorSettings(color: .green, volume: CGFloat(Float(text) ?? 0.5))
        case blueTextField:
            guard let text = blueTextField.text else { return }
            changeColorSettings(color: .blue, volume: CGFloat(Float(text) ?? 0.5))
        default:
            print("Надеюсь, мы никогда не увидим это сообщение")
        }
    }
}


/*
  списал с форума SwiftBook, пока не до конца разобрался. Буду разбираться, а клавиатуру пока обычную поставлю
 
 
extension ViewController {
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Готово", style: UIBarButtonItem.Style.done, target: self, action: Selector(("doneButtonAction")))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.redTextField.inputAccessoryView = doneToolbar
        self.greenTextField.inputAccessoryView = doneToolbar
        self.blueTextField.inputAccessoryView = doneToolbar
        
    }

    func doneButtonAction() {
        changeViewColor()
        self.redTextField.resignFirstResponder()
    }
}
*/
