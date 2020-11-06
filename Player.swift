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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

