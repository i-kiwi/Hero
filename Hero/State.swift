//
//  State.swift
//  Hero
//
//  Created by i－Kiwi on 16/5/3.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

// 状态
class State {

    // role
    var role = Role.getInstance()
    // 剑
    var sword: SKSpriteNode!
    // 枪
    var gun: SKSpriteNode!
    //
    
    //
    var stateBox:SKSpriteNode!
    
    let boxFactory = BoxFactory.getInstance()
    
    
    let single: String!
    static var state: State!
    class func getInstance() -> State {
        if let instance = self.state{
            return instance
        }else{
            self.state = State()
            return self.state
        }
    }
    
    init(){
        self.single = "the single mode"
        self.stateBox = boxFactory.getModuleContainerBox()
        
        initEquip()
    }
    
    // 初始化装备栏
    func initEquip(){
//        let upPosition = CGPointMake(SCENE_SIZE.width / 2, MID_BOX_HEIGHT * 0.8)
//        let downPosition = CGPointMake(SCENE_SIZE.width / 2 , MID_BOX_HEIGHT * 0.2)
//        let leftUPosition = CGPointMake(SCENE_SIZE.width * 0.8, MID_BOX_HEIGHT * 0.66)
//        let leftDPosition = CGPointMake(SCENE_SIZE.width * 0.8, MID_BOX_HEIGHT * 0.33)
//        let rightUPosition = CGPointMake(SCENE_SIZE.width * 0.2 , MID_BOX_HEIGHT * 0.66)
//        let rightDPosition = CGPointMake(SCENE_SIZE.width * 0.2 , MID_BOX_HEIGHT * 0.33)e
//        let upL = CGPointMake(SCENE_SIZE.width / 3, MID_BOX_HEIGHT * 0.8)
//        let upR = CGPointMake(SCENE_SIZE.width * 0.66, MID_BOX_HEIGHT * 0.8)
//        let left = CGPointMake(SCENE_SIZE.width / 6, MID_BOX_HEIGHT / 2)
//        let right = CGPointMake(SCENE_SIZE.width * 0.83, MID_BOX_HEIGHT / 2)
//        let downL = CGPointMake(SCENE_SIZE.width / 3, MID_BOX_HEIGHT * 0.2)
//        let downR = CGPointMake(SCENE_SIZE.width * 0.66, MID_BOX_HEIGHT * 0.2)
        let margin: CGFloat = 200
        let yPosition: CGFloat = 300
        let point1 = CGPoint(x: (SCENE_SIZE.width - margin) * 0.2 + margin / 2, y: yPosition)
        let point2 = CGPoint(x: (SCENE_SIZE.width - margin) * 0.4 + margin / 2, y: yPosition - 100)
        let point3 = CGPoint(x: (SCENE_SIZE.width - margin) * 0.6 + margin / 2, y: yPosition)
        let point4 = CGPoint(x: (SCENE_SIZE.width - margin) * 0.8 + margin / 2, y: yPosition - 100)
        
        // 剑
        self.sword = SKSpriteNode()
        sword.zPosition = EQUIP_ZPOSITION
        sword.position = point1
        let swordTexture = (self.role.wearingGoods.value(forKey: SWORD_EQUIP_NAME) as? Goods)?.ico
        sword.addChild(boxFactory.getHexagonShape(swordTexture))
        self.stateBox.addChild(sword)
        
        // 枪
        self.gun = SKSpriteNode()
        gun.zPosition = EQUIP_ZPOSITION
        gun.position = point2
        let gunTexture = (self.role.wearingGoods.value(forKey: GUN_EQUIP_NAME) as? Goods)?.ico
        gun.addChild(boxFactory.getHexagonShape(gunTexture))
        self.stateBox.addChild(gun)
        

        let temp = SKSpriteNode()
        temp.zPosition = EQUIP_ZPOSITION
        temp.position = point3
        let tempTexture = (self.role.wearingGoods.value(forKey: SWORD_EQUIP_NAME) as? Goods)?.ico
        temp.addChild(boxFactory.getHexagonShape(tempTexture))
        self.stateBox.addChild(temp)
        
        let temp2 = SKSpriteNode()
        temp2.zPosition = EQUIP_ZPOSITION
        temp2.position = point4
        let temp2Texture = (self.role.wearingGoods.value(forKey: SWORD_EQUIP_NAME) as? Goods)?.ico
        temp2.addChild(boxFactory.getHexagonShape(temp2Texture))
        self.stateBox.addChild(temp2)
        

        
        
        
        
    }
    
}
