//
//  GameScene.swift
//  SpaceGame2
//
//  Created by Mohamed Fadul on 11/5/20.
//  Copyright © 2020 MoApps. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //MARK: - PROPERTIES
     var background = SKSpriteNode()
    
    var player = Player()
    
    //MARK: - SYSTEMS
    
    override func didMove(to view: SKView) {
        background = childNode(withName: "Background") as! SKSpriteNode
        }
    
    override func update(_ currentTime: TimeInterval) {
        moveBG()
    }
}
    //MARK: - CONFIGURATIONS
    
extension GameScene {
    // TODO - BACKGROUND
    
    func setupNodes() {
        createBG()
        createPlayer()
    }
    
    // TODO: - BACKGROUND
    
    func createBG() {
        for i in 0...2 {
            let bg = SKSpriteNode(imageNamed: "background")
            bg.zPosition = -1.0
            bg.name = "BG"
            bg.position = CGPoint(x: frame.width/2.0, y: CGFloat(i)*bg.frame.height + frame.height/2.0)
            addChild(bg)
        }
    }
    
    func moveBG() {
        enumerateChildNodes(withName: "Background") { (node, _) in
            let node = node as! SKSpriteNode
            node.position.y -= 50
            
            if node.position.y < -self.frame.height {
                node.position.y += self.frame.height*2.0 + self.frame.height/2.0
            }
        }
    }
    
    // TODO: PLAYER
    
    func createPlayer() {
        player.position = CGPoint(x: frame.width/2.0, y: frame.height * 0.3)
        addChild(player)
    }
}
