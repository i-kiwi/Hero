//
//  ButtonFactory.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/23.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class ButtonFactory {

    var btnArr: [SKSpriteNode]!
    
    let single: String!
    static var btnFactory: ButtonFactory!
    class func getInstance() -> ButtonFactory {
        if let instance = btnFactory {
            return instance
        }else{
            btnFactory = ButtonFactory()
            return btnFactory
        }
    }
    
    init(){
        self.single = "the single model"
        btnArr = []
        initBtnArr()
    }
    
    func initBtnArr() {
        for i in 0 ... 7 {
            // container
            let node = SKSpriteNode()
            node.zPosition = 100
            node.anchorPoint = CGPointMake(0, 0)
//            node.size = CGSizeMake(BUTTON_WIDTH, BUTTON_HEIGHT)
            
            // shape
            let shape = SKShapeNode(rect: CGRectMake(0, 0, BUTTON_WIDTH, BUTTON_HEIGHT), cornerRadius: BUTTON_RADIUS)
            shape.strokeColor = BUTTON_LINE_COLOR
            shape.fillColor = BUTTON_FILL_COLOR
            shape.lineWidth = BUTTON_LINE_WIDTH
            shape.name = "\(BUTTON_NAME)\(i)"
            // button ico
            shape.fillTexture = SKTexture(imageNamed: "btn\(i)_0.png")
            node.addChild(shape)
            // position
            if i < 4 {
                node.position = CGPointMake((SCENE_SIZE.width - BUTTON_WIDTH * 4) / 5 * (CGFloat(i) + 1) + CGFloat(i) * BUTTON_WIDTH, BTM_BOX_HEIGHT / 1.8)
            }else{
                node.position = CGPointMake((SCENE_SIZE.width - BUTTON_WIDTH * 4) / 5 * (CGFloat(i) - 3) + (CGFloat(i) - 4) * BUTTON_WIDTH, BTM_BOX_HEIGHT / 7.5)
            }
            self.btnArr.append(node)
            
        }
    }
    
    
}
