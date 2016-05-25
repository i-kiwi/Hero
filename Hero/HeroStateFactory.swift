//
//  HeroStateFactory.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/22.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class HeroStateFactory: SKSpriteNode {
    
    let single: String!
    static var instance: HeroStateFactory!
    class func getInstance() -> HeroStateFactory {
        if let factory = instance {
            return factory
        }else{
            instance = HeroStateFactory()
            return instance
        }
    }
    
    init(){
        self.single = "the single model"
        let texture = SKTexture(imageNamed: "body2")
        let size = CGSizeMake(texture.size().width, texture.size().height)
        super.init(texture: texture, color: UIColor.whiteColor(), size: size)
        
        self.anchorPoint = CGPointMake(0.5, 0.5)
        self.zPosition = BODY_ZPOSITION
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
