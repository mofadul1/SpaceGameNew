//
//  Player.swift
//  SpaceGame2
//
//  Created by Mohamed Fadul on 11/5/20.
//  Copyright © 2020 MoApps. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "player-fly")
        super.init(texture: texture, color: .clear, size: texture.size())
        zPosition = 1.0
        setScale(0.7)
        setupPhysics(texture)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupPhysics(_ texture: SKTexture) {
        physicsBody = SKPhysicsBody(texture: texture, size: size)
    //    physicsBody!.allowsRotation = false
        physicsBody!.categoryBitMask = PhysicsCategory.Player
        physicsBody!.collisionBitMask = PhysicsCategory.None
        physicsBody!.contactTestBitMask = PhysicsCategory.Enemy
    }
}

