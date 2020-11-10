//
//  Types.swift
//  SpaceGameNew
//
//  Created by Mohamed Fadul on 11/9/20.
//  Copyright © 2020 MoApps. All rights reserved.
//

import Foundation

struct PhysicsCategory {
    static let None:            UInt32 = 0     //0
    static let Player:          UInt32 = 0b1   //1
    static let Enemy:           UInt32 = 0b10  //2
    static let Bullet:          UInt32 = 0b100 //4
}
