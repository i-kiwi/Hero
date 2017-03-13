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
        tainer.position = CGPoint(x: 5, y: self.makingBtmFrame.frame.height)
        if let crop: SKCropNode? = self.boxFactory.crop{
            crop?.removeAllChildren()
            crop?.addChild(tainer)
        }
        self.listRange = (self.makingBtmFrame.frame.height, self.tainer.frame.height)
    }
    
    func bottomFrameTurnZero(_ length: CGFloat){
        if self.listRange.btm < self.makingBtmFrame.frame.height{
            return
        }
        
        if let _ = self.tainer{
            if self.tainer.position.y < listRange.top{
                // turn top
                self.tainer.removeAllActions()
                let action = SKAction.moveTo(y: listRange.top, duration: 0.1)
                self.tainer.run(action)
            }else if self.tainer.position.y > listRange.btm{
                print("\(self.tainer.position.y)")
                // turn bottom
                self.tainer.removeAllActions()
                let action = SKAction.moveTo(y: listRange.btm, duration: 0.1)
                self.tainer.run(action)
            }else if abs(length) > 5 && self.tainer.position.y > listRange.top && self.tainer.position.y < listRange.btm {
                var action: SKAction!
                // 拉动可能会产生的距离
                let distance = self.tainer.position.y + length * 10
                let duration: TimeInterval = 0.5
                if distance < self.listRange.top{
                    action = SKAction.moveTo(y: self.listRange.top, duration: duration)
                } else if distance > self.listRange.btm {
                    action = SKAction.moveTo(y: self.listRange.btm, duration: duration)
                } else {
                    action = SKAction.moveBy(x: 0, y: length * 10, duration: duration)
                }
                
                self.tainer.removeAllActions()
                action.timingMode = SKActionTimingMode.easeOut
                self.tainer.run(action)
            }
        }
    }
    
    // get bottom frame content model
    func getBottomFrameContentModel(_ gs: [Goods]) -> SKShapeNode{
        
        
        let tainer = SKShapeNode(rect: CGRect(x: 0, y: 0, width: CONTENT_MODEL_WIDTH, height: MAKING_CONTENT_MODEL_HEIGHT * CGFloat(gs.count)))
        tainer.zPosition = CONTENT_ZPOSITION
        var index: CGFloat = 0
        for goods in gs {
            let model = SKSpriteNode()
            model.name = MAKING_TAINER_NAME
            model.anchorPoint = CGPoint(x: 0, y: 1)
            model.size = CGSize(width: CONTENT_MODEL_WIDTH, height: MAKING_CONTENT_MODEL_HEIGHT)
            model.position = CGPoint(x: CONTENT_MODEL_MARGIN, y: -MAKING_CONTENT_MODEL_HEIGHT * index)
            model.zPosition = CONTENT_ZPOSITION
            
            goods.addToListContent(model, index: Int(index))
            tainer.addChild(model)
            index += 1
        }
        tainer.strokeColor = UIColor.clear
        return tainer
    }
    
    
}
