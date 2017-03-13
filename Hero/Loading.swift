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
    
    override func didMove(to view: SKView) {
        // init
        self.size = SCENE_SIZE
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = UIColor.gray
        
        
        self.hero = HeroRunFactory.getInstance()
        hero.position = CGPoint(x: 0, y: 0)
        self.addChild(hero)
        self.hero.run()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let homeScene = Home()
        self.view?.presentScene(homeScene, transition: SKTransition.fade(withDuration: 0.5))
    }

}
