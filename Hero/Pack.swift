//
//  Pack.swift
//  Hero
//
//  Created by i－Kiwi on 16/5/7.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class Pack {
    
    var packBox: SKSpriteNode!
    var bigFrame: SKSpriteNode!
    
    let role = Role.getInstance()
    let boxFactory = BoxFactory.getInstance()
    var tainer: SKShapeNode!
    
    // 内容列表上下浮动范围
    var listRange: (top: CGFloat, btm: CGFloat)!
    
    static var pack: Pack!
    let single: String!
    class func getInstance() -> Pack{
        if let instance = self.pack {
            return instance
        }else {
            self.pack = Pack()
            return self.pack
        }
    }
    
    init(){
        self.single = "the single mode"
        self.packBox = boxFactory.getModuleContainerBox()
        self.bigFrame = boxFactory.getBigModuleFrame()
        self.packBox.addChild(bigFrame)
        
        initBigFrame()
    }
    
    func initBigFrame(){
        self.tainer = self.getGoodsFrameModel()
        tainer.position = CGPointMake(5, self.bigFrame.frame.height)
        if let crop: SKCropNode? = self.boxFactory.crop{
            crop?.removeAllChildren()
            crop?.addChild(tainer)
        }
        self.listRange = (self.bigFrame.frame.height, self.tainer.frame.height + 100)
    }
    
    func getGoodsFrameModel() -> SKShapeNode{
        let tainer = SKShapeNode(rect: CGRectMake(0, 0, CONTENT_MODEL_WIDTH, CGFloat(self.role.goodsCountUpperLimit) / PACK_GOODS_ROW_SIZE * (PACK_GOODS_FRAME_WIDTH + PACK_GOODS_FRAME_MARGIN)))
        tainer.zPosition = CONTENT_ZPOSITION
        
        var yPoint: CGFloat = -100
        for index in 0 ..< self.role.goodsCountUpperLimit  {
            let model = SKSpriteNode()
            model.color = UIColor.lightGrayColor()
            model.name = PACK_TAINER_NAME//"\(PACK_GOODS_NAME)\(index)"
            model.anchorPoint = CGPointMake(0, 1)
            model.size = CGSizeMake(PACK_GOODS_FRAME_WIDTH, PACK_GOODS_FRAME_WIDTH)
            if CGFloat(index) % PACK_GOODS_ROW_SIZE == 0 {
                yPoint += PACK_GOODS_FRAME_WIDTH + PACK_GOODS_FRAME_MARGIN
            }
            model.position = CGPointMake(50 + CGFloat(index) % PACK_GOODS_ROW_SIZE * (PACK_GOODS_FRAME_WIDTH + PACK_GOODS_FRAME_MARGIN), -yPoint)
            model.zPosition = CONTENT_ZPOSITION
            
            tainer.addChild(model)
        }
        tainer.strokeColor = UIColor.clearColor()
        return tainer
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
}
