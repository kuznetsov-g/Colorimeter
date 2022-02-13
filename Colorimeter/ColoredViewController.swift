//
//  ColoredViewController.swift
//  Colorimeter
//
//  Created by Георгий Кузнецов on 13.02.2022.
//

import UIKit

class ColoredViewController: UIViewController {
    var redValue: Float = 1
    var greenValue: Float = 1
    var blueValue: Float = 1
    
    var delegate: ColoredVCDelegate!
    
    @IBAction func paintButtonPressed(_ sender: Any) {
        delegate.getColors(red: redValue,
                           green: greenValue,
                           blue: blueValue)
        print("delegate is worked")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: CGFloat(redValue),
                                       green: CGFloat(greenValue),
                                       blue: CGFloat(blueValue),
                                       alpha: 1
                                      )
    }
    


}
