//
//  ViewController.swift
//  Qna
//
//  Created by ChiuWanNuo on 2019/11/18.
//  Copyright © 2019 ChiuWanNuo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var looper: AVPlayerLooper?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let url = URL(string: "https://bit.ly/37vVtgD"){
            let player = AVQueuePlayer()
            let item = AVPlayerItem(url: url)
            looper = AVPlayerLooper(player: player, templateItem: item)
        
            player.play()
        
        }
    }


}

