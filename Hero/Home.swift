//
//  GameScene.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/20.
//  Copyright (c) 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class Home: SKScene {
    
    var hero: HeroStateFactory!
    let boxFactory = BoxFactory.getInstance()
    
    override func didMoveToView(view: SKView) {
        self.size = SCENE_SIZE
        self.anchorPoint = CGPointMake(0, 0)
        self.backgroundColor = UIColor.whiteColor()
        
        let boxBack = self.boxFactory.backBox
        self.addChild(boxBack)
        
        let boxFactory = BoxFactory.getInstance()
        let topBox = boxFactory.topBox
        let midBox = boxFactory.midBox
        let btmBox = boxFactory.btmBox
        self.addChild(topBox)
        self.addChild(midBox)
        self.addChild(btmBox)
        
    
        let btnFactroy = ButtonFactory.getInstance()
        let btnArr = btnFactroy.btnArr
        for btn in btnArr {
            self.addChild(btn)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touchPosition = touches.first?.locationInNode(self.boxFactory.btmBox){
            print("\(touchPosition)")
            let node = nodeAtPoint(touchPosition)
            print("\(node.name)")
//            if node.name == "button0"{
//                print("hello")
//            }
        }
        
    }
    
}
