//
//  AttackPanelFactory.swift
//  Hero
//
//  Created by i－Kiwi on 16/5/24.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class AttackPanelFactory {
    
    var attackButton:SKSpriteNode!
    var upButton:SKSpriteNode!
    var downButton:SKSpriteNode!
    var leftButton:SKSpriteNode!
    var rightButton:SKSpriteNode!
    
    var pack1:SKSpriteNode!
    var pack2:SKSpriteNode!
    
    var gunSlide:SKSpriteNode!
    var gunButton:SKSpriteNode!
    
    

    let single :String!
    static var instance:AttackPanelFactory!
    class func getInstance() -> AttackPanelFactory {
        if let factory = self.instance{
            return factory
        }else{
            self.instance = AttackPanelFactory()
            return self.instance
        }
    }
    
    init(){
        self.single = "the single mode"
        initPanelButton()
        
        
    }
    
    // 初始化攻击面板
    func initPanelButton(){
        self.attackButton = self.getPanelRect((250, 250), name: attackButtonName.attack.rawValue)
        self.upButton = self.getPanelRect((250, 100), name: attackButtonName.up.rawValue)
        self.downButton = self.getPanelRect((250, 100), name: attackButtonName.down.rawValue)
        self.leftButton = self.getPanelRect((100, 250), name: attackButtonName.left.rawValue)
        self.rightButton = self.getPanelRect((100, 250), name: attackButtonName.right.rawValue)
        self.pack1 = self.getPanelRect((150, 150), name: attackButtonName.pack1.rawValue, radius: 50)
        self.pack2 = self.getPanelRect((150, 150), name: attackButtonName.pack2.rawValue, radius: 50)
        self.gunSlide = self.getPanelRect((100, 400), name: attackButtonName.gunSlide.rawValue, radius: 60)
        self.gunButton = self.getPanelRect((150, 150), name: attackButtonName.gun.rawValue, radius: 50, imageName: "alpha4")
        self.gunButton.zPosition = self.gunSlide.zPosition + 5
    }
    
    
    // 获取面板矩形
    func getPanelRect(size:(CGFloat, CGFloat), name: String, radius: CGFloat = 25, imageName: String = "alpha5") -> SKSpriteNode{
        let sprite = SKSpriteNode()
        sprite.anchorPoint = CGPointMake(0.5, 0.5)
        sprite.zPosition = ATTACK_PANEL_ZPOSITION
        
        let shape = SKShapeNode(rect: CGRectMake(-size.0 / 2, -size.1 / 2, size.0, size.1), cornerRadius: radius)
        shape.strokeColor = UIColor.blackColor()
        shape.lineWidth = 3
        shape.fillColor = UIColor.whiteColor()
        shape.fillTexture = SKTexture(imageNamed: imageName)
        shape.name = name
        sprite.addChild(shape)
        return sprite
    }
    
    func attackBeganAction() -> SKAction{
        return SKAction.scaleTo(0.99, duration: 0.02)
    }
    func attackEndedAction() -> SKAction{
        return SKAction.scaleTo(1, duration: 0.02)
    }
    
    
}
