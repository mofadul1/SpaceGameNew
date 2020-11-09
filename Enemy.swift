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
        let enemy = Enemy(imageNamed: "enemy1-fly")
        enemy.health = 2
        enemy.type = .small
        enemy.zPosition = 5.0
        enemy.setScale(0.3)
        return enemy
    }
    class func createEnemyMedium() -> Enemy {
    let enemy = Enemy(imageNamed: "enemy2-fly")
    enemy.health = 5
    enemy.type = .medium
    enemy.zPosition = 5.0
    enemy.setScale(0.4)
    return enemy
    }
    class func createEnemyLarge() -> Enemy {
    let enemy = Enemy(imageNamed: "enemy3-fly")
    enemy.health = 9
    enemy.type = .large
    enemy.zPosition = 5.0
    enemy.setScale(0.5)
    return enemy
    }
}
