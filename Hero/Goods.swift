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
    
    
    func addToListContent(_ sprite: SKSpriteNode, index: Int){
        // index
        let indexLabel = SKLabelNode(fontNamed: FONT_FAMILY_BOLD_NAME)
        indexLabel.fontColor = UIColor.white
        indexLabel.text = "\(index + 1)"
        indexLabel.fontSize = 40
        indexLabel.position = CGPoint(x: 20, y: -60)
        sprite.addChild(indexLabel)
        
        // ico
        let icoNode = SKShapeNode(rect: CGRect(x: 50, y: -((MAKING_CONTENT_MODEL_HEIGHT - LIST_ICO_NODE_WIDTH) / 2 + LIST_ICO_NODE_WIDTH), width: LIST_ICO_NODE_WIDTH, height: LIST_ICO_NODE_WIDTH), cornerRadius: 90)
        icoNode.strokeColor = LIST_ICO_NODE_COLOR
        icoNode.lineWidth = LIST_ICO_NODE_LINE_WIDTH
        icoNode.fillColor = UIColor.white
        icoNode.fillTexture = self.ico
        icoNode.name = "\(GOODS_ICO_NAME)\(index)"
//        self.timeFrame = icoNode.copy() as! SKShapeNode
//        sprite.addChild(timeFrame)
        sprite.addChild(icoNode)
        
        
        // name
        let nameLabel = SKLabelNode(fontNamed: FONT_FAMILY_NAME)
        nameLabel.fontColor = UIColor.white
        nameLabel.text = self.name
        nameLabel.fontSize = 40
        nameLabel.position = CGPoint(x: 250, y: -80)
        nameLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        sprite.addChild(nameLabel)
        
        // attribute
        let attribute = SKLabelNode(fontNamed: FONT_FAMILY_NAME)
        attribute.fontColor = UIColor.gray
        attribute.text = self.attribute
        attribute.fontSize = 35
        attribute.position = CGPoint(x: 250, y: -160)
        attribute.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        sprite.addChild(attribute)
        
        // bottom line
        let btmLine = SKShapeNode(rect: CGRect(x: 0, y: -MAKING_CONTENT_MODEL_HEIGHT, width: CONTENT_MODEL_WIDTH, height: 1))
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


// 食物
class Food: Goods {
    
}
// 武器
class arms: Goods {
    
}
// 材料
class stuff: Goods {
    
}
