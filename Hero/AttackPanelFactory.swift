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
//        self.attackButton = self.getPanelRect((250, 250), name: attackButtonName.attack.rawValue)
//        self.upButton = self.getPanelRect((250, 100), name: attackButtonName.up.rawValue)
//        self.downButton = self.getPanelRect((250, 100), name: attackButtonName.down.rawValue)
//        self.leftButton = self.getPanelRect((100, 250), name: attackButtonName.left.rawValue)
//        self.rightButton = self.getPanelRect((100, 250), name: attackButtonName.right.rawValue)
//        self.pack1 = self.getPanelRect((150, 150), name: attackButtonName.pack1.rawValue, radius: 50)
//        self.pack2 = self.getPanelRect((150, 150), name: attackButtonName.pack2.rawValue, radius: 50)
//        self.gunSlide = self.getPanelRect((100, 400), name: attackButtonName.gunSlide.rawValue, radius: 60)
//        self.gunButton = self.getPanelRect((150, 150), name: attackButtonName.gun.rawValue, radius: 50, imageName: "alpha4")
//        self.gunButton.zPosition = self.gunSlide.zPosition + 5
        
        self.attackButton = getMenuSprite(AttackImgName.attack.rawValue, name: attackButtonName.attack.rawValue)
        self.leftButton = getMenuSprite(AttackImgName.direction.rawValue, name: attackButtonName.left.rawValue)
        self.upButton = getMenuSprite(AttackImgName.direction.rawValue, name: attackButtonName.up.rawValue)
        self.upButton.zRotation = CGFloat(M_PI_2 * 3)
        self.rightButton = getMenuSprite(AttackImgName.direction.rawValue, name: attackButtonName.right.rawValue)
        self.rightButton.zRotation = CGFloat(M_PI)
        self.downButton = getMenuSprite(AttackImgName.direction.rawValue, name: attackButtonName.down.rawValue)
        self.downButton.zRotation = CGFloat(M_PI_2)
        self.pack1 = getMenuSprite(AttackImgName.pack.rawValue, name: attackButtonName.pack1.rawValue)
        self.pack2 = getMenuSprite(AttackImgName.pack.rawValue, name: attackButtonName.pack2.rawValue)
        self.gunSlide = getMenuSprite(AttackImgName.gunSlide.rawValue, name: attackButtonName.gunSlide.rawValue)
        self.gunButton = getMenuSprite(AttackImgName.fire.rawValue, name: attackButtonName.gun.rawValue)
        self.gunButton.zPosition = self.gunSlide.zPosition + 5
    }
    
    
    // 获取面板矩形
    func getPanelRect(_ size:(CGFloat, CGFloat), name: String, radius: CGFloat = 25, imageName: String = "alpha5") -> SKSpriteNode{
        let sprite = SKSpriteNode()
        sprite.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        sprite.zPosition = ATTACK_PANEL_ZPOSITION
        
        let shape = SKShapeNode(rect: CGRect(x: -size.0 / 2, y: -size.1 / 2, width: size.0, height: size.1), cornerRadius: radius)
        shape.strokeColor = UIColor.black
        shape.lineWidth = 3
        shape.fillColor = UIColor.white
        shape.fillTexture = SKTexture(imageNamed: imageName)
        shape.name = name
        sprite.addChild(shape)
        return sprite
    }
    // 获取攻击菜单按钮精灵
    func getMenuSprite(_ imageName: String, name: String) -> SKSpriteNode{
        let sprite = SKSpriteNode(imageNamed: imageName)
        sprite.zPosition = ATTACK_PANEL_ZPOSITION
        sprite.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        sprite.name = name
        return sprite
    }
    
    func attackBeganAction() -> SKAction{
        return SKAction.scale(to: 0.99, duration: 0.02)
    }
    func attackEndedAction() -> SKAction{
        return SKAction.scale(to: 1, duration: 0.02)
    }
    
    
}
