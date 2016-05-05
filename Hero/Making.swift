//
//  Making.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/24.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class Making {
    
    var makingBox:SKSpriteNode!
    var makingTopFrame:SKSpriteNode!
    var makingBtmFrame:SKSpriteNode!
    
    var tainer: SKShapeNode!

    // box factory
    let boxFactory = BoxFactory.getInstance()
    // role
    let role = Role.getInstance()
    // 内容列表上下浮动范围
    var listRange: (top: CGFloat, btm: CGFloat)!

    let single: String!
    static var making: Making!
    class func getInstance() -> Making {
        if let instance = self.making {
            return instance
        }else{
            making = Making()
            return making
        }
    }
    
    init(){
        self.single = "the single model"
        initMakingBox()
        initTopFrame()
        initBottomFrame()
    }
    
    // init making box
    func initMakingBox(){
        self.makingBox = boxFactory.getModuleContainerBox()
        
        self.makingTopFrame = boxFactory.getModuleTopFrame()
        self.makingBtmFrame = boxFactory.getModuleBottomFrame()
        
        
        makingBox.addChild(makingTopFrame)
        makingBox.addChild(makingBtmFrame)
    }
    
    func initTopFrame(){
        // TODO
    }
    
    func initBottomFrame(){
        self.tainer = self.getBottomFrameContentModel(self.role.entitledGoods)
        tainer.position = CGPointMake(5, self.makingBtmFrame.frame.height)
        if let crop: SKCropNode? = self.boxFactory.crop{
            crop?.removeAllChildren()
            crop?.addChild(tainer)
        }
        self.listRange = (self.makingBtmFrame.frame.height, self.tainer.frame.height)
    }
    
    func bottomFrameTurnZero(length: CGFloat){
        
        if let _ = self.tainer{
            if self.tainer.position.y < listRange.top{
                // turn top
                self.tainer.removeAllActions()
                let action = SKAction.moveToY(listRange.top, duration: 0.1)
                self.tainer.runAction(action)
            }else if self.tainer.position.y > listRange.btm{
                // turn bottom
                self.tainer.removeAllActions()
                let action = SKAction.moveToY(listRange.btm, duration: 0.1)
                self.tainer.runAction(action)
            }else if abs(length) > 5 && self.tainer.position.y > listRange.top && self.tainer.position.y < listRange.btm {
                var action: SKAction!
                // 拉动可能会产生的距离
                let distance = self.tainer.position.y + length * 10
                let duration: NSTimeInterval = 0.5
                if distance < self.listRange.top{
                    action = SKAction.moveToY(self.listRange.top, duration: duration)
                } else if distance > self.listRange.btm {
                    action = SKAction.moveToY(self.listRange.btm, duration: duration)
                } else {
                    action = SKAction.moveByX(0, y: length * 10, duration: duration)
                }
                
                self.tainer.removeAllActions()
                action.timingMode = SKActionTimingMode.EaseOut
                self.tainer.runAction(action)
            }
        }
    }
    
    // get bottom frame content model
    func getBottomFrameContentModel(gs: [Goods]) -> SKShapeNode{
        
        
        let tainer = SKShapeNode(rect: CGRectMake(0, 0, CONTENT_MODEL_WIDTH, MAKING_CONTENT_MODEL_HEIGHT * CGFloat(gs.count)))
        tainer.zPosition = CONTENT_ZPOSITION
        var index: CGFloat = 0
        for goods in gs {
            let model = SKSpriteNode()
            model.name = MAKING_TAINER_NAME
            model.anchorPoint = CGPointMake(0, 1)
            model.size = CGSizeMake(CONTENT_MODEL_WIDTH, MAKING_CONTENT_MODEL_HEIGHT)
            model.position = CGPointMake(CONTENT_MODEL_MARGIN, -MAKING_CONTENT_MODEL_HEIGHT * index)
            model.zPosition = CONTENT_ZPOSITION
            
            goods.addToListContent(model, index: Int(index))
            tainer.addChild(model)
            index += 1
        }
        
        return tainer
    }
    
    
}
