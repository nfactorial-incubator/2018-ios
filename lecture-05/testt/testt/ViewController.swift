//
//  ViewController.swift
//  testt
//
//  Created by Aidar Nugmanov on 6/29/18.
//  Copyright © 2018 Aidar Nugmanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewControllerDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            
            if let dvc = segue.destination as? DestinationViewController {
                dvc.text = self.textField.text
                dvc.delegate = self
            }
            
        }
    }

    @IBAction func unwind(segue: UIStoryboardSegue) {
        
    }
    
    func setText(text: String) {
        self.label.text = text
    }
    
}

