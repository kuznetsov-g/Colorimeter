//
//  ColoredViewController.swift
//  Colorimeter
//
//  Created by Георгий Кузнецов on 13.02.2022.
//

import UIKit
protocol ViewControllerDelegate {
    func getColors(red: Float, green: Float, blue: Float)
}

class ColoredViewController: UIViewController {
    var redValue: Float = 1
    var greenValue: Float = 1
    var blueValue: Float = 1
    
    
    
    @IBAction func paintButtonPressed(_ sender: Any) {

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

extension ColoredViewController: ViewControllerDelegate {
    func getColors(red: Float, green: Float, blue: Float) {
        redValue = red
        greenValue = green
        blueValue = blue
    }
    
    
}

extension ColoredViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let MainVC = segue.destination as? ViewController else { return }
        MainVC.delegate = self
        print("prepare")
    }
    
    @IBAction override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        print("unwind")
    }
}


