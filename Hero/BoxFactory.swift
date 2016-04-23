//
//  BoxFactory.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/22.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class BoxFactory {
    
    var backBox: SKSpriteNode!
    
    var topBox: SKSpriteNode!
    
    var midBox: SKSpriteNode!
    
    var btmBox: SKSpriteNode!
    
    
    static var boxFactory: BoxFactory!
    class func getInstance() -> BoxFactory {
        if let instance = self.boxFactory {
            return instance
        }else{
            boxFactory = BoxFactory()
            return boxFactory
        }
    }
    
    init(){
        boxBackInit()
        
        boxInit()
    }
    
    
    func boxBackInit(){
        self.backBox = SKSpriteNode(imageNamed: "backgroundImg.jpg")
        backBox.anchorPoint = CGPointMake(0, 0)
        backBox.zPosition = BOX_ZPOSITION
        backBox.position = CGPointMake(0, 0)
        backBox.size = SCENE_SIZE
        
//        let boxLine = SKSpriteNode(imageNamed: "backBox")
//        boxLine.anchorPoint = CGPointMake(0, 0)
//        boxLine.zPosition = BOX_ZPOSITION
//        boxLine.position = CGPointMake(0, 0)
//        boxLine.size = SCENE_SIZE
//        
//        self.backBox.addChild(boxLine)
        
    }
    
    
    func boxInit(){
        // top box
        self.topBox = SKSpriteNode()
        let topBoxHeight: CGFloat = TOP_BOX_HEIGHT
        topBox.size = CGSizeMake(SCENE_SIZE.width, topBoxHeight)
        topBox.position = CGPointMake(0, SCENE_SIZE.height - topBoxHeight)
        topBox.anchorPoint = CGPointMake(0, 0)
        topBox.zPosition = BOX_ZPOSITION
        // top box line
        let topBoxLine = SKShapeNode(rect: CGRectMake(BOX_LINE_MARGIN, BOX_LINE_MARGIN, topBox.frame.width - BOX_LINE_MARGIN * 2 , topBox.frame.height - BOX_LINE_MARGIN * 2), cornerRadius: 10)
        topBoxLine.strokeColor = BOX_LINE_COLOR
//        topBoxLine.fillColor = BOX_LINE_FILL_COLOR
        topBoxLine.lineWidth = BOX_LINE_WIDTH
        topBoxLine.zPosition = BOX_LINE_ZPOSITION
        topBox.addChild(topBoxLine)
        
        
        // mid box
        self.midBox = SKSpriteNode()
        let midBoxHeight:CGFloat = MID_BOX_HEIGHT
        midBox.size = CGSizeMake(SCENE_SIZE.width, midBoxHeight)
        midBox.position = CGPointMake(0, SCENE_SIZE.height - topBoxHeight - midBoxHeight - 15)
        midBox.anchorPoint = CGPointMake(0, 0)
        midBox.zPosition = BOX_ZPOSITION
        // mid box line
        let midBoxLine = SKShapeNode(rect: CGRectMake(BOX_LINE_MARGIN, BOX_LINE_MARGIN, midBox.frame.width - BOX_LINE_MARGIN * 2, midBox.frame.height - BOX_LINE_MARGIN * 2), cornerRadius: 10)
        midBoxLine.strokeColor = BOX_LINE_COLOR
//        midBoxLine.fillColor = BOX_LINE_FILL_COLOR
        midBoxLine.lineWidth = BOX_LINE_WIDTH
        midBoxLine.zPosition = BOX_LINE_ZPOSITION
        midBox.addChild(midBoxLine)
        
        
        
        // bottom box
        self.btmBox = SKSpriteNode()
        let btmBoxHeight:CGFloat = BTM_BOX_HEIGHT
        btmBox.size = CGSizeMake(SCENE_SIZE.width, btmBoxHeight)
        btmBox.position = CGPointMake(0, 0)
        btmBox.anchorPoint = CGPointMake(0, 0)
        btmBox.zPosition = BOX_ZPOSITION
        // bottom box line
        let btmBoxLine = SKShapeNode(rect: CGRectMake(BOX_LINE_MARGIN, BOX_LINE_MARGIN, btmBox.frame.width - BOX_LINE_MARGIN * 2, btmBox.frame.height - BOX_LINE_MARGIN * 2), cornerRadius: 10)
        btmBoxLine.strokeColor = BOX_LINE_COLOR
//        btmBoxLine.fillColor = BOX_LINE_FILL_COLOR
        btmBoxLine.lineWidth = BOX_LINE_WIDTH
        btmBoxLine.zPosition = BOX_LINE_ZPOSITION
        btmBox.addChild(btmBoxLine)
    }
    
    
}
