//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSliderValueChanged(_ sender: UISlider) {
        if sender == heightSlider {
            let height = String(format: "%.2f",sender.value)
            heightLabel.text = "\(height)m"
        } else {
            let weight = Int(sender.value)
            weightLabel.text = "\(weight)Kg"
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(height: height,weight: weight)
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
        // Manually creating viewcontroller and performing navigation
//        print("\(bmi)")
//        let secondVC = SecondViewController()
//        secondVC.bmiValue = String(format: "%.1f", bmi)
//        self.present(secondVC, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinaationVC = segue.destination as! ResultViewController
            destinaationVC.bmiValue = calculatorBrain.getBMIValue()
            destinaationVC.advice = calculatorBrain.getAdvice()
            destinaationVC.color = calculatorBrain.getColor()
        }
    }
}

