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
    let heroSprite = RoleTexture.getInstance()
    
    
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
        if let crop = self.boxFactory.crop{
            self.heroSprite.position = CGPoint(x: self.exploreBtmFrame.frame.width / 2, y: self.exploreBtmFrame.frame.height / 2)
            crop.removeAllChildren()
            crop.addChild(self.heroSprite)
            crop.addChild(SKShapeNode())//添加一个空图形，否则SKCropNode背景不渲染
            self.heroSprite.run()
        }
        
        
    
        
    }
}
