//
//  loginViewController.swift
//  meditation-test
//
//  Created by Shadab Khan on 4/19/18.
//  Copyright © 2018 Shadab Khan. All rights reserved.
//

import Foundation
import UIKit

class loginViewController: UIViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //- ////////////
    override func viewDidLoad() {
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainViewController") as! mainViewController
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    //-//////
    
    
}
