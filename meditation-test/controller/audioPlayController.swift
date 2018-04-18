//
//  audioPlayController.swift
//  meditation-test
//
//  Created by Shadab Khan on 4/18/18.
//  Copyright © 2018 Shadab Khan. All rights reserved.
//

import Foundation
import  UIKit

class audioPlayController:UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func backToAudioTable(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "audioTableView") as! audioTableView
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
}
