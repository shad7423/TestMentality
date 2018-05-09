//
//  File.swift
//  meditation-test
//
//  Created by Shadab Khan on 4/17/18.
//  Copyright © 2018 Shadab Khan. All rights reserved.
//

import Foundation
import  UIKit

class SplashScreenViewController : UIViewController {
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.createMenuView()
       // self.createLoginView()
        //self.navigationController?.navigationBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension SplashScreenViewController{
    
    func createMenuView() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainViewController") as! mainViewController
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
     }
    func createLoginView(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginViewController") as! loginViewController
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
        
    }
    
}
