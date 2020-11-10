//
//  Enemy.swift
//  SpaceGameNew
//
//  Created by Mohamed Fadul on 11/6/20.
//  Copyright © 2020 MoApps. All rights reserved.
//

import SpriteKit

enum EnemySettings: Int {
    case small = 0, medium, large
}


class Enemy: SKSpriteNode {
    
    var health: Int = 0
    var type: EnemySettings = .small
    
    class func createEnemySmall() -> Enemy {
        let enemy = setupEnemies("enemy1-fly", health: 5, type: .medium, scale: 0.3)
       // enemy.setScale(0.3)
        return enemy
    }
    class func createEnemyMedium() -> Enemy {
        let enemy = setupEnemies("enemy2-fly", health: 5, type: .medium, scale: 0.6)
    //enemy.setScale(0.5)
    return enemy
    }
    class func createEnemyLarge() -> Enemy {
    let enemy = setupEnemies("enemy3-fly", health: 9, type: .large)
   // enemy.setScale(0.8)
    return enemy
    }
    
    class func setupEnemies(_ imgNamed: String, health: Int, type: EnemySettings, scale: CGFloat = 1.0) -> Enemy {
        let sprite = Enemy(imageNamed: imgNamed)
        sprite.type = type
        sprite.health = health
        sprite.zPosition = 5.0
        sprite.setScale(scale)
        sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: sprite.size)
        sprite.physicsBody!.allowsRotation = false
        sprite.physicsBody!.categoryBitMask = PhysicsCategory.Enemy
        sprite.physicsBody!.collisionBitMask = PhysicsCategory.Bullet | PhysicsCategory.Player
        sprite.physicsBody!.contactTestBitMask = PhysicsCategory.Bullet | PhysicsCategory.Player
        return sprite
    }
}
