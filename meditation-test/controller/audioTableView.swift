//
//  audioTableView.swift
//  meditation-test
//
//  Created by Shadab Khan on 4/11/18.
//  Copyright © 2018 Shadab Khan. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
//import  MediaPlayer
//import  Chameleon
//import MBProgressHUD

class audioTableView: UIViewController,AVAudioPlayerDelegate, UITableViewDelegate,UITableViewDataSource {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //-
    @IBAction func goToPlayButton(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "audioPlayController") as! audioPlayController
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    @IBAction func backToHomeButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
 //- //////////////////////////////////
    var audioPlayer : AVAudioPlayer = AVAudioPlayer()
   
    var cellArray = ["FOUNDATION" , "HEALTH", "BRAVE" , "HAPPINESS" ,"WORK & PERFORMANCE", "STUDENT","SPORT"]
    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        //tableView.rowHeight = 140
        
        //playAudioFile()
        let urlString = "http://ec2-18-219-135-78.us-east-2.compute.amazonaws.com/audio_files/1521739954.mp3"
        let url = NSURL(string: urlString)
        
        downloadFileFromURL(url: url!)
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel?.text = cellArray[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if audioPlayer.isPlaying {
            audioPlayer.stop()
            
        }else {
            audioPlayer.play()
        }
        
    
    }
    
    //- function ///////
    func playAudioFile(url:NSURL) {
        print("play func call")
        
//        guard let url1 = url
//            else {
//                print("return")
//                return
//        }
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: url as URL)
           // try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord)

            audioPlayer.prepareToPlay()
            //audioPlayer.play()
            print("play success")
            
        } catch let error {
            print(error.localizedDescription)
            print("Failed audio play")
        }
    }
    
    
    func downloadFileFromURL(url:NSURL){
        
        var downloadTask:URLSessionDownloadTask
        downloadTask = URLSession.shared.downloadTask(with: url as URL, completionHandler: { [weak self](URL, response, error) -> Void in
            self?.playAudioFile(url: URL! as NSURL)
        })
        
        downloadTask.resume()
        
    }
    
}

//- table view
class tableView : UITableView {
    
}
