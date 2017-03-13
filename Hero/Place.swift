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
    
    func addToListContent(_ sprite: SKSpriteNode, index: Int){
        // index
        let indexLabel = SKLabelNode(fontNamed: FONT_FAMILY_BOLD_NAME)
        indexLabel.fontColor = UIColor.white
        indexLabel.text = "\(index + 1)"
        indexLabel.fontSize = 40
        indexLabel.position = CGPoint(x: 20, y: -60)
        sprite.addChild(indexLabel)
        
        // ico
//        let icoNode = boxFactory.getSquareShape(self.ico)
//        icoNode.position = CGPointMake(150, -140)
//        icoNode.strokeColor = UIColor.lightGrayColor()
//        icoNode.name = "\(PLACE_ICO_NAME)\(index)"
//        sprite.addChild(icoNode)
        let icoNode = SKSpriteNode(texture: self.ico)
        icoNode.name = "\(PLACE_ICO_NAME)\(index)"
        icoNode.position = CGPoint(x: 150, y: -140)
        sprite.addChild(icoNode)
        
        // bottom line
        let btmLine = SKShapeNode(rect: CGRect(x: 0, y: -MAP_CONTENT_MODEL_HEIGHT, width: CONTENT_MODEL_WIDTH, height: 1))
        btmLine.strokeColor = UIColor.lightGray
        sprite.addChild(btmLine)
        if index == 0 {
            // top line
            let topLine = SKShapeNode(rect: CGRect(x: 0, y: 0, width: CONTENT_MODEL_WIDTH, height: 1))
            topLine.strokeColor = UIColor.lightGray
            sprite.addChild(topLine)
        }
    }
}
