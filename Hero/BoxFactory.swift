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
        self.backBox = SKSpriteNode(imageNamed: "backImg3.jpg")//"backgroundImg.jpg")
        backBox.anchorPoint = CGPoint(x: 0, y: 0)
        backBox.zPosition = BOX_ZPOSITION
        backBox.position = CGPoint(x: 0, y: 0)
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
        topBox.size = CGSize(width: SCENE_SIZE.width, height: topBoxHeight)
        topBox.position = CGPoint(x: 0, y: SCENE_SIZE.height - topBoxHeight)
        topBox.anchorPoint = CGPoint(x: 0, y: 0)
        topBox.zPosition = BOX_ZPOSITION
        // top box line
        let topBoxLine = SKShapeNode(rect: CGRect(x: BOX_LINE_MARGIN, y: BOX_LINE_MARGIN, width: topBox.frame.width - BOX_LINE_MARGIN * 2 , height: topBox.frame.height - BOX_LINE_MARGIN * 2), cornerRadius: 10)
        topBoxLine.strokeColor = BOX_LINE_COLOR
        topBoxLine.fillColor = BOX_LINE_FILL_COLOR
        topBoxLine.lineWidth = BOX_LINE_WIDTH
        topBoxLine.zPosition = BOX_LINE_ZPOSITION
        topBoxLine.fillTexture = SKTexture(imageNamed: "alpha\(BOX_BACK_ALPHA).png")
        topBox.addChild(topBoxLine)
        
        
        // mid box
        self.midBox = SKSpriteNode()
        let midBoxHeight:CGFloat = MID_BOX_HEIGHT
        midBox.size = CGSize(width: SCENE_SIZE.width, height: midBoxHeight)
        midBox.position = CGPoint(x: 0, y: SCENE_SIZE.height - topBoxHeight - midBoxHeight - 15)
        midBox.anchorPoint = CGPoint(x: 0, y: 0)
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
        btmBox.size = CGSize(width: SCENE_SIZE.width, height: btmBoxHeight)
        btmBox.position = CGPoint(x: 0, y: 0)
        btmBox.anchorPoint = CGPoint(x: 0, y: 0)
        btmBox.zPosition = BOX_ZPOSITION
        // bottom box line
        let btmBoxLine = SKShapeNode(rect: CGRect(x: BOX_LINE_MARGIN, y: BOX_LINE_MARGIN, width: btmBox.frame.width - BOX_LINE_MARGIN * 2, height: btmBox.frame.height - BOX_LINE_MARGIN * 2), cornerRadius: 10)
        btmBoxLine.strokeColor = BOX_LINE_COLOR
        btmBoxLine.fillColor = BOX_LINE_FILL_COLOR
        btmBoxLine.lineWidth = BOX_LINE_WIDTH
        btmBoxLine.zPosition = BOX_LINE_ZPOSITION
        btmBoxLine.fillTexture = SKTexture(imageNamed: "alpha\(BOX_BACK_ALPHA).png")
        btmBox.addChild(btmBoxLine)
    }
    
    
    /** ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ module ~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
    
    // get module container box
    func getModuleContainerBox() -> SKSpriteNode{
        let containerBox = SKSpriteNode()
        let shape = SKShapeNode(rect: CGRect(x: BOX_LINE_MARGIN, y: BOX_LINE_MARGIN, width: SCENE_SIZE.width - BOX_LINE_MARGIN * 2, height: MID_BOX_HEIGHT - BOX_LINE_MARGIN * 2), cornerRadius: HOME_BOX_RADIUS)
        shape.strokeColor = CONTAINER_BOX_LINE_COLOR
        shape.lineWidth = BOX_LINE_WIDTH
        shape.fillColor = CONTAINER_BOX_FILL_COLOR
        shape.zPosition = CONTAINER_BOX_LINE_ZPOSITION
        shape.name = SHAPE_NAME
        shape.fillTexture = SKTexture(imageNamed: "alpha\(BOX_BACK_ALPHA).png")
        containerBox.size = shape.frame.size
        containerBox.zPosition = CONTAINER_BOX_ZPOSITION
        containerBox.addChild(shape)

        return containerBox
    }
    
    // get module top frame
    func getModuleTopFrame() -> SKSpriteNode {
        let topFrame = SKSpriteNode()
        let shape = SKShapeNode(rect: CGRect(x: FRAME_MARGIN, y: FRAME_MARGIN * 2 + BOTTOM_FRAME_HEIGHT, width: SCENE_SIZE.width - FRAME_MARGIN * 2, height: TOP_FRAME_HEIGHT), cornerRadius: FRAME_RADIUS)
        shape.strokeColor = FRAME_LINE_COLOR
        shape.lineWidth = FRAME_LINE_WIDTH
        shape.fillColor = FRAME_FILL_COLOR
        shape.zPosition = FRAME_LINE_ZPOSITION
        shape.fillTexture = SKTexture(imageNamed: "alpha4")
        
        topFrame.size = shape.frame.size
        topFrame.zPosition = FRAME_ZPOSITION
        topFrame.addChild(shape)
        return topFrame
    }
    
    // get module bottom frame
    func getModuleBottomFrame() -> SKSpriteNode {
        let bottomFrame = SKSpriteNode()
        bottomFrame.anchorPoint = CGPoint(x: 0, y: 0)
        bottomFrame.position = CGPoint(x: FRAME_MARGIN, y: FRAME_MARGIN)
        
        let size = CGSize(width: SCENE_SIZE.width - FRAME_MARGIN * 2, height: BOTTOM_FRAME_HEIGHT)
        let showScope = SKShapeNode(rect: CGRect(x: 0, y: FRAME_LINE_WIDTH, width: size.width, height: size.height - FRAME_LINE_WIDTH * 2), cornerRadius: FRAME_RADIUS)
        showScope.fillColor = UIColor.white
        let shape = SKShapeNode(rect: CGRect(x: 0, y: 0, width: size.width, height: size.height), cornerRadius: FRAME_RADIUS)
        shape.strokeColor = FRAME_LINE_COLOR
        shape.lineWidth = FRAME_LINE_WIDTH
        shape.fillColor = FRAME_FILL_COLOR
        shape.zPosition = FRAME_LINE_ZPOSITION
        shape.fillTexture = SKTexture(imageNamed: "alpha4")
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
        bigFrame.anchorPoint = CGPoint(x: 0, y: 0)
        bigFrame.position = CGPoint(x: FRAME_MARGIN, y: FRAME_MARGIN)
        let size = CGSize(width: SCENE_SIZE.width - FRAME_MARGIN * 2, height: BIG_FRAME_HEIGHT)
        let showScope = SKShapeNode(rect: CGRect(x: 0, y: FRAME_LINE_WIDTH, width: size.width, height: size.height - FRAME_LINE_WIDTH * 2), cornerRadius: FRAME_RADIUS)
        showScope.fillColor = UIColor.white
        let shape = SKShapeNode(rect: CGRect(x: 0, y: 0, width: size.width, height: size.height), cornerRadius: FRAME_RADIUS)
        shape.strokeColor = FRAME_LINE_COLOR
        shape.lineWidth = FRAME_LINE_WIDTH
        shape.fillColor = FRAME_FILL_COLOR
        shape.zPosition = FRAME_LINE_ZPOSITION
        shape.fillTexture = SKTexture(imageNamed: "alpha4")
        
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
    func getHexagonShape(_ texture: SKTexture?) -> SKShapeNode{
        let transform = CGAffineTransform(translationX: -50, y: -80)
        let path = CGMutablePath()
        let point0 = CGPoint(x: 0, y: 0)
        let point1 = CGPoint(x: 100, y: 0)
        let point2 = CGPoint(x: 140, y: 80)
        let point3 = CGPoint(x: 100, y: 160)
        let point4 = CGPoint(x: 0, y: 160)
        let point5 = CGPoint(x: -40, y: 80)
        let point6 = CGPoint(x: 0, y: 0)
//        CGPathAddLines(path, [transform], [point0,point1,point2,point3,point4,point5,point6], 7)
        
        let hexagon = SKShapeNode(path: path)
        hexagon.strokeColor = UIColor.black
        hexagon.fillColor = UIColor.white
        hexagon.lineWidth = 5
        let defaultTexture = SKTexture(imageNamed: "btn0.jpg")
        hexagon.fillTexture = texture ?? defaultTexture
        
        return hexagon
    }
    
    
    
    // 获取一个四边形边框
    func getSquareShape(_ texture: SKTexture?) -> SKShapeNode{
        let transform = CGAffineTransform(translationX: 0, y: -100)
        let path = CGMutablePath()
        let point0 = CGPoint(x: 0, y: 0)
        let point1 = CGPoint(x: 100, y: 100)
        let point2 = CGPoint(x: 0, y: 200)
        let point3 = CGPoint(x: -100, y: 100)
        let point4 = CGPoint(x: 0, y: 0)
//        CGPathAddLines(path, [transform], [point0,point1,point2,point3,point4], 5)
        
        let hexagon = SKShapeNode(path: path)
        hexagon.strokeColor = UIColor.black
        hexagon.fillColor = UIColor.white
        hexagon.lineWidth = 5
        let defaultTexture = SKTexture(imageNamed: "btn0.jpg")
        hexagon.fillTexture = texture ?? defaultTexture
        
        return hexagon
    }
    
    // 获取消息框
    func getMessageBox(_ xAnchorPoint: CGFloat, direction: CGFloat) -> SKSpriteNode{
        let messageBox = SKSpriteNode(color: UIColor.lightGray, size: CGSize(width: 400, height: 250))
        messageBox.anchorPoint = CGPoint(x: xAnchorPoint, y: 40 / 250 + 1)
        messageBox.position = CGPoint(x: 0, y: 0)
        messageBox.yScale = direction
        
        let transform = CGAffineTransform(translationX: 0, y: -40)
        let path = CGMutablePath()
        let point0 = CGPoint(x: 40, y: 0)
        let point1 = CGPoint(x: 0, y: 40)
        let point2 = CGPoint(x: -40, y: 0)
//        CGPathAddLines(path, [transform], [point0,point1,point2], 3)
        let triangle = SKShapeNode(path: path)
        triangle.strokeColor = UIColor.black
        triangle.fillColor = UIColor.white
        triangle.lineWidth = 5
        
        messageBox.addChild(triangle)
        
        return messageBox
    }
    
    
    
    
    
    
    
}
