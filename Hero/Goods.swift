//
//  Potion.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/24.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class Goods{
    
    var name: String!
    var ico: SKTexture!
    var attribute: String!
    var detail: String!
    var time: CLong!
    var childrens: [Goods]!
    
//    var timeFrame:SKShapeNode!
    
    
    func addToListContent(sprite: SKSpriteNode, index: Int){
        // index
        let indexLabel = SKLabelNode(fontNamed: FONT_FAMILY_BOLD_NAME)
        indexLabel.fontColor = UIColor.whiteColor()
        indexLabel.text = "\(index + 1)"
        indexLabel.fontSize = 40
        indexLabel.position = CGPointMake(20, -60)
        sprite.addChild(indexLabel)
        
        // ico
        let icoNode = SKShapeNode(rect: CGRectMake(50, -((MAKING_CONTENT_MODEL_HEIGHT - LIST_ICO_NODE_WIDTH) / 2 + LIST_ICO_NODE_WIDTH), LIST_ICO_NODE_WIDTH, LIST_ICO_NODE_WIDTH), cornerRadius: 90)
        icoNode.strokeColor = LIST_ICO_NODE_COLOR
        icoNode.lineWidth = LIST_ICO_NODE_LINE_WIDTH
        icoNode.fillColor = UIColor.whiteColor()
        icoNode.fillTexture = self.ico
        icoNode.name = "\(GOODS_ICO_NAME)\(index)"
//        self.timeFrame = icoNode.copy() as! SKShapeNode
//        sprite.addChild(timeFrame)
        sprite.addChild(icoNode)
        
        
        // name
        let nameLabel = SKLabelNode(fontNamed: FONT_FAMILY_NAME)
        nameLabel.fontColor = UIColor.whiteColor()
        nameLabel.text = self.name
        nameLabel.fontSize = 40
        nameLabel.position = CGPointMake(250, -80)
        nameLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        sprite.addChild(nameLabel)
        
        // attribute
        let attribute = SKLabelNode(fontNamed: FONT_FAMILY_NAME)
        attribute.fontColor = UIColor.grayColor()
        attribute.text = self.attribute
        attribute.fontSize = 35
        attribute.position = CGPointMake(250, -160)
        attribute.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        sprite.addChild(attribute)
        
        // bottom line
        let btmLine = SKShapeNode(rect: CGRectMake(0, -MAKING_CONTENT_MODEL_HEIGHT, CONTENT_MODEL_WIDTH, 1))
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


// 食物
class Food: Goods {
    
}
// 武器
class arms: Goods {
    
}
// 材料
class stuff: Goods {
    
}
