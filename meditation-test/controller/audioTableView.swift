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

class audioTableView: UIViewController,AVAudioPlayerDelegate, UITableViewDelegate,UITableViewDataSource{
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        //self.view.viewWithTag(1)?.isHidden = true
        viewShow()
    }
    
    //-
    @IBAction func goToPlayButton(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "audioPlayController") as! audioPlayController
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
        vc.aduioTempBool = audioBool
    }
    @IBAction func backToHomeButton(_ sender: UIButton) {
        if audioBool == true { audioPlayer.stop() }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainViewController") as! mainViewController
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
 //- //////////////////////////////////
    
    var audioCell = audioViewCell()
    var audioPlayer : AVAudioPlayer = AVAudioPlayer()
    var audioBool :Bool?
   
    var cellArray = ["FOUNDATION" , "HEALTH", "BRAVE" , "HAPPINESS" ,"WORK & PERFORMANCE", "STUDENT","SPORT"]
    var imageArray = ["","","","","","","","","","","","","","",]
    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        //tableView.rowHeight = 140
        
        //playAudioFile()
        let urlString = "http://ec2-18-219-135-78.us-east-2.compute.amazonaws.com/audio_files/1521739954.mp3"
        let url = NSURL(string: urlString)
        if myReachability.isConnectedToNetwork(){
        downloadFileFromURL(url: url!)
        } else {
         showalert(title: "", message: "Please Check Internet Connection.")
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        //cell.textLabel?.text = cellArray[indexPath.row]
        cell.textLabel?.text = imageArray[indexPath.row]
        //audioCell.audioCellImage.image = imageArray[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if myReachability.isConnectedToNetwork(){
         if audioPlayer.isPlaying {
            audioPlayer.stop()
            audioBool = false
            viewShow()
            
        }else {
            audioPlayer.play()
            audioBool = true
            viewShow()
        }
        } else {
            self.showalert(title: "", message: "please check internet connection")
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
    
    func showalert (title: String,message : String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        self.present(alert, animated: true, completion: nil)
   }
    
    func viewShow (){
        if audioBool! {
            self.view.viewWithTag(1)?.isHidden = false
        } else {
            self.view.viewWithTag(1)?.isHidden = true
        }
    }
    
}
