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
        return SKAction.repeatActionForever(SKAction.sequence([SKAction.scaleTo(1.1, duration: 0.2),SKAction.scaleTo(1, duration: 0.2)]))
    }
}
