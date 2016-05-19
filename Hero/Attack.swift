//
//  Attack.swift
//  Hero
//
//  Created by i－Kiwi on 16/5/12.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class Attack: SKScene {
    
    var clickTime: CFTimeInterval = 0
    
    let boxFactory = BoxFactory.getInstance()
    let hero = HeroRunFactory.getInstance()
    
    
    override func didMoveToView(view: SKView) {
        toViewInit()
    }
    
    func toViewInit(){
        // init self scene
        self.size = SCENE_SIZE
        self.anchorPoint = CGPointMake(0, 0)
        self.backgroundColor = UIColor.whiteColor()
        
        // init background
        let boxBack = self.boxFactory.backBox
        self.addChild(boxBack)
        
        // init top/mid/btm box
        let topBox = boxFactory.topBox
        let midBox = boxFactory.midBox
        let btmBox = boxFactory.btmBox
        self.addChild(topBox)
        self.addChild(midBox)
        self.addChild(btmBox)
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let node = self.nodeAtPoint((touches.first?.locationInNode(self.boxFactory.btmBox))!) as? SKSpriteNode
        if let _ = node{
            node?.runAction(SKAction.fadeOutWithDuration(1))
            let nowClickTime = CACurrentMediaTime()
            if nowClickTime - self.clickTime < 1 {
                //1秒内双击
                print("double+")
            }
            self.clickTime = nowClickTime
        }
        
    }
}
