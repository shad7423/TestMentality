//
//  audioTableView.swift
//  meditation-test
//
//  Created by Shadab Khan on 4/11/18.
//  Copyright © 2018 Shadab Khan. All rights reserved.
//

import Foundation
import UIKit

class audioTableView: UITableViewController {
    var cellArray = ["FOUNDATION" , "HEALTH", "BRAVE" , "HAPPINESS" ,"WORK & PERFORMANCE", "STUDENT","SPORT"]
    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        table.estimatedRowHeight = 200.0
        
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel?.text = cellArray[indexPath.row]
        
        return cell
    }
    
    
}
