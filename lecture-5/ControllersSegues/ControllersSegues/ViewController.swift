//
//  ViewController.swift
//  ControllersSegues
//
//  Created by Aidar Nugmanov on 6/29/18.
//  Copyright © 2018 Aidar Nugmanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func segueButtonTapped(_ sender: Any) {
//        
//        let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "destinationId") as! DestinationViewController
//        
//        self.navigationController?.pushViewController(destinationVC, animated: true)
//
        
        self.performSegue(withIdentifier: "pushSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destionationVC = segue.destination as? DestinationViewController {
            
            destionationVC.textLabel.text = self.textField.text
            
        }

    }
    
}

