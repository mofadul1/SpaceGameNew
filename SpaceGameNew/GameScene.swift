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
        createEnemy()
        setupNodes()
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        player.run(.move(to: location, duration: 0.1))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        player.position = location
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        moveBG()
    }
}
    //MARK: - CONFIGURATIONS
    
extension GameScene {
    // TODO - BACKGROUND
    
    func setupNodes() {
     //   createBG()
        createPlayer()
        spawnEnemies()
        createBullet()
        setupPhysics()
    }
    
    func setupPhysics() {
        physicsWorld.gravity = .zero
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
        
        run(.repeatForever(.sequence(
            [.wait(forDuration: 0.2), .run {
            [weak self] in
            self?.createBullet()
            }])))
        
       // player.zPosition = 5
       // player = childNode(withName: "Player") as! SKSpriteNode as! Player
    }
    
    // TODO: Enemies
    
    func createEnemy() {
        let enemy: Enemy
        let type: EnemySettings
        var duration = CGFloat.random(in: 3...5)
        switch Int(arc4random() % 100) {
        case 0...75:
            enemy = Enemy.createEnemySmall()
            type = .small
            duration = CGFloat.random(in: 2...4)
        case 75...97:
            enemy = Enemy.createEnemyMedium()
            type = .medium
            duration = CGFloat.random(in: 5...7)
        default:
            enemy = Enemy.createEnemyLarge()
            type = .large
            duration = CGFloat.random(in: 7...9)
            break
        }
        
        enemy.type = type
        
        let enemyF = enemy.frame
        let randomX = CGFloat.random(min: enemyF.width, max: frame.width - enemyF.height)
        enemy.position = CGPoint(x: randomX, y: frame.height + enemyF.height/2.0)
        //enemy.position = CGPoint(x: -50, y: -50)
        addChild(enemy)
        let move = SKAction.moveTo(y: 0.0, duration: TimeInterval(duration))
        enemy.run(.repeatForever(.sequence([move,.removeFromParent()])))
    }
    func spawnEnemies() {
        run(.repeatForever(.sequence([
            .wait(forDuration: 0.4),
            .run { [weak self] in
                self?.createEnemy()
            }
        ])))
    }
    
    //TODO: - Bullet
    
    func createBullet() {
        let bullet = SKSpriteNode(imageNamed: "bullet")
        bullet.setScale(0.3)
        bullet.position = player.position
        bullet.physicsBody = SKPhysicsBody(texture: bullet.texture!, size: bullet.size)
        if let physicsBody = bullet.physicsBody
        {
            physicsBody.usesPreciseCollisionDetection = true
            physicsBody.allowsRotation = false
            physicsBody.categoryBitMask = PhysicsCategory.Bullet
            physicsBody.collisionBitMask = PhysicsCategory.None
            physicsBody.contactTestBitMask = PhysicsCategory.Enemy
        }
       
        addChild(bullet)
        
        let moveBy = SKAction.moveBy(x: 0.0, y: frame.height, duration: 0.5)
        bullet.run(.repeatForever(.sequence([moveBy, .removeFromParent()])))
        }
    
}
