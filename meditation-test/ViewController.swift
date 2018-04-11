//
//  ViewController.swift
//  meditation-test
//
//  Created by Shadab Khan on 4/8/18.
//  Copyright © 2018 Shadab Khan. All rights reserved.
//

import UIKit

//struct cellData {
//    let text: String!
//    let image : UIImage!
//    
//    
//}

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    
    

  //  var arrayCustomCell = [cellData]()
    
    var arrayImage = [UIImage(named: "albumArt"),UIImage(named: "albumArt"),UIImage(named: "albumArt"),UIImage(named: "albumArt")]
    var arrayText = ["frst","second","third","fourth"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
       
        
        
    }
    
    
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return arrayImage.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! belowCollectionViewCell
                cell.imageCustom.image = arrayImage[indexPath.row]
                cell.textCustom.text = arrayText[indexPath.row]
            
            
            return cell
        }
        
        
        
    

   
}

