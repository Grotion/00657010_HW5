//
//  AVPlayerController.swift
//  00657010_HW5
//
//  Created by Shaun Ku on 2019/12/30.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import Foundation
import AVKit
import SwiftUI

class AVPlayerController: UIViewController
{
   var looper: AVPlayerLooper?
   @IBAction func play(_ sender: Any)
   {
      if let url = URL(string: "http://bit.ly/2F8EvYE")
      {
         let item = AVPlayerItem(url: url)
         let player = AVQueuePlayer()
         looper = AVPlayerLooper(player: player, templateItem: item)
         let playerViewController = AVPlayerViewController()
         playerViewController.player = player
         present(playerViewController, animated: true, completion:{playerViewController.player?.play()})
      }
   }
}
