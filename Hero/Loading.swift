//
//  Loading.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/22.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class Loading: SKScene {
    var hero: HeroRunFactory!
    
    override func didMoveToView(view: SKView) {
        // init
        self.size = SCENE_SIZE
        self.anchorPoint = CGPointMake(0.5, 0.5)
        self.backgroundColor = UIColor.grayColor()
        
        
        self.hero = HeroRunFactory.getInstance()
        hero.position = CGPointMake(0, 0)
        self.addChild(hero)
        self.hero.run()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let homeScene = Home()
        self.view?.presentScene(homeScene, transition: SKTransition.fadeWithDuration(0.5))
    }

}
