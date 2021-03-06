//
//  ColoredViewController.swift
//  Colorimeter
//
//  Created by Георгий Кузнецов on 13.02.2022.
//

import UIKit
protocol ViewControllerDelegate {
    func getColors(backgroundColor: UIColor)
}

class ColoredViewController: UIViewController {
    var redValue: Float = 0.9
    var greenValue: Float = 0.9
    var blueValue: Float = 0.9

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: CGFloat(redValue),
                                       green: CGFloat(greenValue),
                                       blue: CGFloat(blueValue),
                                       alpha: 1
                                      )
    }
}


// MARK: protocol method
extension ColoredViewController: ViewControllerDelegate {
    func getColors(backgroundColor: UIColor) {
        view.backgroundColor = backgroundColor
    }
}


// MARK: Work with segue
extension ColoredViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let MainVC = segue.destination as? ViewController else { return }
        let viewColor = CIColor(color: self.view.backgroundColor ?? UIColor.red)
        MainVC.delegate = self
        MainVC.redVolume = viewColor.red
        MainVC.greenVolume = viewColor.green
        MainVC.blueVolume = viewColor.blue
    }
    
    @IBAction override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {

    }
}


