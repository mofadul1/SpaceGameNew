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
    
    var player: Player = Player()
    
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
            bg.zPosition = 1
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
        player.zPosition = 5
        player = childNode(withName: "Player") as! SKSpriteNode as! Player
    }
    
    // TODO: Enemies
    
    func createEnemy() {
        let enemy: Enemy
        let type: EnemySettings
        switch Int(arc4random() % 100) {
        case 0...75:
            enemy = Enemy.createEnemySmall()
            type = .small
        case 75...97:
            enemy = Enemy.createEnemyMedium()
            type = .medium
        default:
            enemy = Enemy.createEnemyLarge()
            type = .large
        }
        
        enemy.type = type
        
        let enemyF = enemy.frame
        let randomX = CGFloat.random(min: enemyF.width, max: frame.width - enemyF.height)
        enemy.position = CGPoint(x: randomX,
                                 y: frame.height + enemyF.height/2.0)
        addChild(enemy)
        
    }
    
    
}
