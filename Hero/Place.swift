//
//  Place.swift
//  Hero
//
//  Created by i－Kiwi on 16/5/4.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

// 地点
class Place {

    var name: String!
    var ico: SKTexture!
    let boxFactory = BoxFactory.getInstance()
    // 星级
    var starLV: Int!
    // 得到的星(-1表示没有打过此关卡)
    var hasStar: Int = -1
    var detail: String!
    
    func addToListContent(sprite: SKSpriteNode, index: Int){
        // index
        let indexLabel = SKLabelNode(fontNamed: FONT_FAMILY_BOLD_NAME)
        indexLabel.fontColor = UIColor.whiteColor()
        indexLabel.text = "\(index + 1)"
        indexLabel.fontSize = 40
        indexLabel.position = CGPointMake(20, -60)
        sprite.addChild(indexLabel)
        
        // ico
//        let icoNode = boxFactory.getSquareShape(self.ico)
//        icoNode.position = CGPointMake(150, -140)
//        icoNode.strokeColor = UIColor.lightGrayColor()
//        icoNode.name = "\(PLACE_ICO_NAME)\(index)"
//        sprite.addChild(icoNode)
        let icoNode = SKSpriteNode(texture: self.ico)
        icoNode.name = "\(PLACE_ICO_NAME)\(index)"
        icoNode.position = CGPointMake(150, -140)
        sprite.addChild(icoNode)
        
        // bottom line
        let btmLine = SKShapeNode(rect: CGRectMake(0, -MAP_CONTENT_MODEL_HEIGHT, CONTENT_MODEL_WIDTH, 1))
        btmLine.strokeColor = UIColor.lightGrayColor()
        sprite.addChild(btmLine)
        if index == 0 {
            // top line
            let topLine = SKShapeNode(rect: CGRectMake(0, 0, CONTENT_MODEL_WIDTH, 1))
            topLine.strokeColor = UIColor.lightGrayColor()
            sprite.addChild(topLine)
        }
    }
}
