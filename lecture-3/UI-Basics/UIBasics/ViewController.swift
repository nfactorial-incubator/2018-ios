//
//  ViewController.swift
//  UIBasics
//
//  Created by Zhanserik on 6/27/18.
//  Copyright © 2018 Kenes Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text,
            let displayText = displayLabel.text else { return }
        
        if title == "=" {
            let value = calculate(expression: displayText)
            displayLabel.text = "\(value)"
        }
        else if title == "C" {
            displayLabel.text = ""
        }
        else {
            displayLabel.text = displayText + title
        }
    }
    
    func calculate(expression: String) -> Double {
        let exp = NSExpression(format: expression)
        let value = exp.expressionValue(with: nil, context: nil) as! Double
        return value
    }
    
}

