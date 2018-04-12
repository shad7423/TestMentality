//
//  ViewController.swift
//  meditation-test
//
//  Created by Shadab Khan on 4/8/18.
//  Copyright © 2018 Shadab Khan. All rights reserved.
//

import UIKit
import TCPickerView

//struct cellData {
//    let text: String!
//    let image : UIImage!
//    
//    
//}

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,TCPickerViewDelegate{
    


  //  var arrayCustomCell = [cellData]()
    
    var arrayImage = [UIImage(named: "albumArt"),UIImage(named: "albumArt"),UIImage(named: "albumArt"),UIImage(named: "albumArt")]
    var arrayText = ["frst","second","third","fourth"]
    
    let picker = TCPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.mainColor = UIColor.white
        picker.closeButtonColor = UIColor.white
        
        
       
        }
    
    
    //- bottom collecton ///////
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return arrayImage.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! belowCollectionViewCell
                cell.imageCustom.image = arrayImage[indexPath.row]
                cell.textCustom.text = arrayText[indexPath.row]
            
            
            return cell
        }
        
    // ///////
        
    // picker view
    func pickerView(_ pickerView: TCPickerView, didSelectRowAtIndex index: Int) {
        print("Uuser select row at index: \(index)")
    }
    
    
    @IBAction func categoriesButton(_ sender: Any) {
       
        //picker.title = "Today, learn About"
        //picker.title.append("choose from below topics")
        
       
        
        
        
        
        picker.titleFont = UIFont.systemFont(ofSize:25, weight: .bold)
        let categories = [
            "Quit Smoking",
            "Determination",
            "Mental well being",
            "The Power of Decision",
            "The Power of Feelings",
            "The Psychology of Belief",
            "Mental Conditioning",
            "Nicotine Addiction",
            "The First Steps",
            "The Truth About Smoking"
        ]
        
        let values = categories.map { TCPickerView.Value(title: $0) }
        picker.values = values
        picker.delegate = self
        picker.itemsFont = UIFont.systemFont(ofSize: 18, weight: .light)
        picker.selection = .single
        picker.completion = { (selectedIndexes) in
            for i in selectedIndexes {
                print(values[i].title)
            }
        }
        picker.show()
    }
    
    @IBAction func moodButton(_ sender: UIButton) {
        
        picker.title = " My Current Mood"
        // picker.closeButtonColor = UIColor(cgColor: "FDB164" as! CGColor)
        picker.titleFont = UIFont.systemFont(ofSize:20, weight: .light)
        let mood = [
            "Relax",
            "Embarrassed",
            "Flip",
            "Uplifted",
            "Lonely",
            "Sad",
            "Anxious",
            "Happy",
            "Overwhelmed"
        ]
        
        let values = mood.map { TCPickerView.Value(title: $0) }
        picker.values = values
        picker.delegate = self
        picker.itemsFont = UIFont.systemFont(ofSize: 18, weight: .light)
        picker.selection = .single
        picker.completion = { (selectedIndexes) in
            for i in selectedIndexes {
                print(values[i].title)
            }
        }
        picker.show()
    }
    
    // ////////////////////////////////////
    
    //- start session
    
    @IBAction func startSessionButton(_ sender: UIButton) {
        
        
    }
    
    // ////

   
}

