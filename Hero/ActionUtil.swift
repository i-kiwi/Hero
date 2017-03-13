//
//  ActionUtil.swift
//  Hero
//
//  Created by i－Kiwi on 16/5/19.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

extension SKAction {

    public class func shake() -> SKAction{
        return SKAction.repeatForever(SKAction.sequence([SKAction.scale(to: 1.1, duration: 0.1),SKAction.scale(to: 1, duration: 0.1)]))
    }
}
