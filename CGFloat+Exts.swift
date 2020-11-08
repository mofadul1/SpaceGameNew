//
//  CGFloat+Exts.swift
//  SpaceGameNew
//
//  Created by Mohamed Fadul on 11/7/20.
//  Copyright © 2020 MoApps. All rights reserved.
//

import CoreGraphics

extension CGFloat {
    
    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(0xFFFFFFFF))
    }
    
    static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        assert(min < max)
        return CGFloat.random() * (max - min) + min
    }
}
