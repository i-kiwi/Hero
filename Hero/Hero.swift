//
//  Hero.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/20.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class Hero: NSObject {
    
    
    var heroNode:SKSpriteNode = HeroSpriteNode.getInstance()
    
    
    
    class HeroSpriteNode: SKSpriteNode{
        
        static var heroNode:SKSpriteNode?
        
        class func getInstance() -> SKSpriteNode{
            if let instance = heroNode {
                return instance
            }else{
                return HeroSpriteNode()
            }
        }
        
    }
}
