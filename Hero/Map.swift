//
//  Map.swift
//  Hero
//
//  Created by i－Kiwi on 16/5/4.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

// 地图
class Map {
    
    var mapBox: SKSpriteNode!
    var bigFrame: SKSpriteNode!
    let boxFactory = BoxFactory.getInstance()
    
    var tainer: SKShapeNode!
    // 角色
    let role = Role.getInstance()
    // 内容列表上下浮动范围
    var listRange: (top: CGFloat, btm: CGFloat)!

    let single: String!
    static var map: Map!
    class func getInstance() -> Map {
        if let instance = self.map{
            return instance
        }else{
            self.map = Map()
            return self.map
        }
    }
    
    init(){
        self.single = "the single mode"
        initMapBox()
        initbigFrame()
    }
    
    func initMapBox(){
        self.mapBox = boxFactory.getModuleContainerBox()
        self.bigFrame = boxFactory.getBigModuleFrame()
        mapBox.addChild(bigFrame)
    }
    
    func initbigFrame(){
        self.tainer = self.getBigFrameContentModel(self.role.placeMap)
        tainer.position = CGPointMake(5, self.bigFrame.frame.height)
        if let crop: SKCropNode? = self.boxFactory.crop{
            crop?.removeAllChildren()
            crop?.addChild(tainer)
        }
        self.listRange = (self.bigFrame.frame.height, self.tainer.frame.height)
    }

    // get bottom frame content model
    func getBigFrameContentModel(places: [Place]) -> SKShapeNode{
        
        
        let tainer = SKShapeNode(rect: CGRectMake(0, 0, CONTENT_MODEL_WIDTH, MAP_CONTENT_MODEL_HEIGHT * CGFloat(places.count)))
        tainer.zPosition = CONTENT_ZPOSITION
        var index: CGFloat = 0
        for place in places {
            let model = SKSpriteNode()
            model.name = MAP_TAINER_NAME
            model.anchorPoint = CGPointMake(0, 1)
            model.size = CGSizeMake(CONTENT_MODEL_WIDTH, MAP_CONTENT_MODEL_HEIGHT)
            model.position = CGPointMake(CONTENT_MODEL_MARGIN, -MAP_CONTENT_MODEL_HEIGHT * index)
            model.zPosition = CONTENT_ZPOSITION
            
            place.addToListContent(model, index: Int(index))
            tainer.addChild(model)
            index += 1
        }
        
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
