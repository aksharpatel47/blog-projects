//
//  ViewController.swift
//  ADPAudioPlayer
//
//  Created by Akshar Patel on 25/09/17.
//  Copyright © 2017 Akshar Patel. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  var player: AVPlayer?
  
  @IBAction func playLocalFile(sender: UIButton) {
    guard let filePath = Bundle.main.path(forResource: "positive_attitude", ofType: "mp3") else {
        print("File does not exist in the bundle.")
        return
    }
    
    let url = URL(fileURLWithPath: filePath)
    
    playUsingAVPlayer(url: url)
  }
  
  @IBAction func playRemoteFile(sender: UIButton) {
    guard let url = URL(string: "https://s3.ap-south-1.amazonaws.com/aksharpatel47-static/positive_attitude.mp3") else {
      print("Invalid URI")
      return
    }
    
    playUsingAVPlayer(url: url)
  }
  
  func playUsingAVPlayer(url: URL) {
    do {
      (try AVAudioPlayer(contentsOf: url)).play()
      try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
      player = AVPlayer(url: url)
      player?.play()
    } catch {
      print(error)
    }
  }
}

