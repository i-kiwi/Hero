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
    
    var crop: SKCropNode!
    
    
    let single: String!
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
        self.single = "the single model"
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
//        let midBoxLine = SKShapeNode(rect: CGRectMake(BOX_LINE_MARGIN, BOX_LINE_MARGIN, midBox.frame.width - BOX_LINE_MARGIN * 2, midBox.frame.height - BOX_LINE_MARGIN * 2), cornerRadius: HOME_BOX_RADIUS)
//        midBoxLine.strokeColor = BOX_LINE_COLOR
//        midBoxLine.fillColor = BOX_LINE_FILL_COLOR
//        midBoxLine.lineWidth = BOX_LINE_WIDTH
//        midBoxLine.zPosition = BOX_LINE_ZPOSITION
//        midBox.addChild(midBoxLine)
        
        
        
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
    
    
    /** ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ module ~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
    
    // get module container box
    func getModuleContainerBox() -> SKSpriteNode{
        let containerBox = SKSpriteNode()
        let shape = SKShapeNode(rect: CGRectMake(BOX_LINE_MARGIN, BOX_LINE_MARGIN, SCENE_SIZE.width - BOX_LINE_MARGIN * 2, MID_BOX_HEIGHT - BOX_LINE_MARGIN * 2), cornerRadius: HOME_BOX_RADIUS)
        shape.strokeColor = CONTAINER_BOX_LINE_COLOR
        shape.lineWidth = BOX_LINE_WIDTH
//        shape.fillColor = CONTAINER_BOX_FILL_COLOR
        shape.zPosition = CONTAINER_BOX_LINE_ZPOSITION
        shape.name = SHAPE_NAME
        containerBox.size = shape.frame.size
        containerBox.zPosition = CONTAINER_BOX_ZPOSITION
        containerBox.addChild(shape)

        return containerBox
    }
    
    // get module top frame
    func getModuleTopFrame() -> SKSpriteNode {
        let topFrame = SKSpriteNode()
        let shape = SKShapeNode(rect: CGRectMake(FRAME_MARGIN, FRAME_MARGIN * 2 + BOTTOM_FRAME_HEIGHT, SCENE_SIZE.width - FRAME_MARGIN * 2, TOP_FRAME_HEIGHT), cornerRadius: FRAME_RADIUS)
        shape.strokeColor = FRAME_LINE_COLOR
        shape.lineWidth = FRAME_LINE_WIDTH
        shape.fillColor = FRAME_FILL_COLOR
        shape.zPosition = FRAME_LINE_ZPOSITION
        
        topFrame.size = shape.frame.size
        topFrame.zPosition = FRAME_ZPOSITION
        topFrame.addChild(shape)
        return topFrame
    }
    
    // get module bottom frame
    func getModuleBottomFrame() -> SKSpriteNode {
        let bottomFrame = SKSpriteNode()
        bottomFrame.anchorPoint = CGPointMake(0, 0)
        bottomFrame.position = CGPointMake(FRAME_MARGIN, FRAME_MARGIN)
        
        let size = CGSizeMake(SCENE_SIZE.width - FRAME_MARGIN * 2, BOTTOM_FRAME_HEIGHT)
        let showScope = SKShapeNode(rect: CGRectMake(0, FRAME_LINE_WIDTH, size.width, size.height - FRAME_LINE_WIDTH * 2), cornerRadius: FRAME_RADIUS)
        showScope.fillColor = UIColor.whiteColor()
        let shape = SKShapeNode(rect: CGRectMake(0, 0, size.width, size.height), cornerRadius: FRAME_RADIUS)
        shape.strokeColor = FRAME_LINE_COLOR
        shape.lineWidth = FRAME_LINE_WIDTH
        shape.fillColor = FRAME_FILL_COLOR
        shape.zPosition = FRAME_LINE_ZPOSITION
        
        let frame = shape.copy() as! SKShapeNode
        
        self.crop = SKCropNode()
        crop.maskNode = showScope//shape
        
        frame.addChild(crop)
        
        bottomFrame.size = shape.frame.size
        bottomFrame.zPosition = FRAME_ZPOSITION
        bottomFrame.addChild(frame)
        
        return bottomFrame
    }
    
    func getBigModuleFrame() -> SKSpriteNode {
        let bigFrame = SKSpriteNode()
        bigFrame.anchorPoint = CGPointMake(0, 0)
        bigFrame.position = CGPointMake(FRAME_MARGIN, FRAME_MARGIN)
        let size = CGSizeMake(SCENE_SIZE.width - FRAME_MARGIN * 2, BIG_FRAME_HEIGHT)
        let showScope = SKShapeNode(rect: CGRectMake(0, FRAME_LINE_WIDTH, size.width, size.height - FRAME_LINE_WIDTH * 2), cornerRadius: FRAME_RADIUS)
        showScope.fillColor = UIColor.whiteColor()
        let shape = SKShapeNode(rect: CGRectMake(0, 0, size.width, size.height), cornerRadius: FRAME_RADIUS)
        shape.strokeColor = FRAME_LINE_COLOR
        shape.lineWidth = FRAME_LINE_WIDTH
        shape.fillColor = FRAME_FILL_COLOR
        shape.zPosition = FRAME_LINE_ZPOSITION
        
        let frame = shape.copy() as! SKShapeNode
        
        self.crop = SKCropNode()
        crop.maskNode = showScope//shape
        
        frame.addChild(crop)
        
        bigFrame.size = shape.frame.size
        bigFrame.zPosition = FRAME_ZPOSITION
        bigFrame.addChild(frame)
        
        return bigFrame
    }
    
    
    // 获取一个六边形边框
    func getHexagonShape(texture: SKTexture?) -> SKShapeNode{
        let transform = CGAffineTransformMakeTranslation(-50, -80)
        let path = CGPathCreateMutable()
        let point0 = CGPointMake(0, 0)
        let point1 = CGPointMake(100, 0)
        let point2 = CGPointMake(140, 80)
        let point3 = CGPointMake(100, 160)
        let point4 = CGPointMake(0, 160)
        let point5 = CGPointMake(-40, 80)
        let point6 = CGPointMake(0, 0)
        CGPathAddLines(path, [transform], [point0,point1,point2,point3,point4,point5,point6], 7)
        
        let hexagon = SKShapeNode(path: path)
        hexagon.strokeColor = UIColor.blackColor()
        hexagon.fillColor = UIColor.whiteColor()
        hexagon.lineWidth = 5
        let defaultTexture = SKTexture(imageNamed: "btn0.jpg")
        hexagon.fillTexture = texture ?? defaultTexture
        
        return hexagon
    }
    
    
    
    // 获取一个四边形边框
    func getSquareShape(texture: SKTexture?) -> SKShapeNode{
        let transform = CGAffineTransformMakeTranslation(0, -100)
        let path = CGPathCreateMutable()
        let point0 = CGPointMake(0, 0)
        let point1 = CGPointMake(100, 100)
        let point2 = CGPointMake(0, 200)
        let point3 = CGPointMake(-100, 100)
        let point4 = CGPointMake(0, 0)
        CGPathAddLines(path, [transform], [point0,point1,point2,point3,point4], 5)
        
        let hexagon = SKShapeNode(path: path)
        hexagon.strokeColor = UIColor.blackColor()
        hexagon.fillColor = UIColor.whiteColor()
        hexagon.lineWidth = 5
        let defaultTexture = SKTexture(imageNamed: "btn0.jpg")
        hexagon.fillTexture = texture ?? defaultTexture
        
        return hexagon
    }
    
    
    
    
    
    
    
    
    
    
}
