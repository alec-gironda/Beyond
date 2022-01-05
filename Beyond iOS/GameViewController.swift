//
//  GameViewController.swift
//  Beyond iOS
//
//  Created by Alec Gironda on 1/2/22.
//

import UIKit
import SpriteKit
import GameplayKit
import CoreMotion
import AVFoundation

class GameViewController: UIViewController {
    
    var backingAudio = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filePath = Bundle.main.path(forResource: "Interstellar-Odyssey", ofType: "mp3")
        let audioURL = URL(fileURLWithPath: filePath!)
        
        do{ backingAudio = try AVAudioPlayer(contentsOf: audioURL)}
        catch{ return print("can't find audio")}
        
        backingAudio.numberOfLoops = -1
        backingAudio.play()
        
        let scene = MainMenuScene(size: CGSize(width: 1536 ,
                                           height: 2048))
        
        scene.scaleMode = .aspectFill
        
        // Present the scene
        let skView = self.view as! SKView
        skView.presentScene(scene)
        
        skView.ignoresSiblingOrder = true
        skView.showsFPS = false
        skView.showsNodeCount = false
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
