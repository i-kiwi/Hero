//
//  Explore.swift
//  Hero
//
//  Created by i－Kiwi on 16/5/3.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

// 探索
class Explore {
    
    
    var exploreBox:SKSpriteNode!
    var exploreTopFrame:SKSpriteNode!
    var exploreBtmFrame:SKSpriteNode!
    
    // box factory
    let boxFactory = BoxFactory.getInstance()
    // role
    let role = Role.getInstance()
    let heroSprite = HeroRunFactory.getInstance()
    
    
    let single: String!
    static var explore: Explore!
    class func getInstance() -> Explore {
        if let instance = self.explore{
            return instance
        }else{
            self.explore = Explore()
            return explore
        }
    }
    
    init(){
        self.single = "the single mode"
        initExploreBox()
        initHeroSprite()
    }
    
    func initExploreBox(){
        self.exploreBox = boxFactory.getModuleContainerBox()
        
        self.exploreTopFrame = boxFactory.getModuleTopFrame()
        self.exploreBtmFrame = boxFactory.getModuleBottomFrame()
        
        
        exploreBox.addChild(exploreTopFrame)
        exploreBox.addChild(exploreBtmFrame)
    }
    
    func initHeroSprite(){
        self.heroSprite.position = CGPointMake(self.exploreBtmFrame.frame.width / 2, self.exploreBtmFrame.frame.height / 2)
        self.exploreBtmFrame.addChild(self.heroSprite)
        self.heroSprite.run()
        
    }
}
