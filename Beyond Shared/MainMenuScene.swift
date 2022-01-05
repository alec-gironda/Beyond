//
//  MainMenuScene.swift
//  Beyond iOS
//
//  Created by Alec Gironda on 1/4/22.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene{
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let titleLabel = SKLabelNode(fontNamed: "theboldfont")
        titleLabel.text = "BEYOND"
        titleLabel.fontSize = 150
        titleLabel.fontColor =  SKColor.white
        titleLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.7)
        titleLabel.zPosition = 1
        self.addChild(titleLabel)
        
        let startLabel = SKLabelNode(fontNamed: "theboldfont")
        startLabel.text = "Start"
        startLabel.fontSize = 80
        startLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.4)
        startLabel.zPosition = 1
        startLabel.name = "startButton"
        self.addChild(startLabel)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches{
            
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = atPoint(pointOfTouch)
            
            if nodeITapped.name == "startButton"{
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            
        }
    }
    
}
