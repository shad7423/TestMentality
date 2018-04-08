//
//  ViewController.swift
//  meditation-test
//
//  Created by Shadab Khan on 4/8/18.
//  Copyright © 2018 Shadab Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func popUp(_ sender: UIButton) {
        let alert = UIAlertController(title: "Today,learn about", message: "Choose from below topics", preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default)
        let alertAction2 = UIAlertAction(title: "Select", style: UIAlertActionStyle.default){
            (UIAlertAction) -> Void in
            
            
        }
        
        alert.addAction(alertAction)
        alert.addAction(alertAction2)
        present(alert, animated: true)
        {
            () -> Void in
        }
    }
    
}

