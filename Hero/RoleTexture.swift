//
//  RoleTextureFacotry.swift
//  Hero
//
//  Created by i－Kiwi on 16/5/22.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

/**
 * 角色纹理工厂
 */
class RoleTexture: SKSpriteNode {
    
    var leftEye: SKSpriteNode!
    var rightEye: SKSpriteNode!
    var roleTestures:[SKTexture]!
    
    let single: String!
    static var instance:RoleTexture!
    class func getInstance() -> RoleTexture{
        if let factory = self.instance{
            return factory
        }else{
            self.instance = RoleTexture()
            return self.instance
        }
    }
    
    init() {
        self.single = "the single model"
        let texture = SKTexture(imageNamed: "p_normal")
        let size = CGSizeMake(texture.size().width, texture.size().height)
        super.init(texture:texture,color:SKColor.whiteColor(),size:size)
        self.anchorPoint = CGPointMake(0.5, 0.5)
        self.zPosition = 100
//        self.userInteractionEnabled = true
        
        // init eye
        self.leftEye = self.getEye()
        self.rightEye = self.getEye()
        self.stopEyeAction()
        self.addChild(leftEye)
        self.addChild(rightEye)
        self.startEyeAction()
        // 跑动的纹理集合
        self.roleTestures = []
        for i in 0 ... 5{
            self.roleTestures.append(SKTexture(imageNamed: "p_run\(i)"))
        }
    }
    
    func run(){
        let run = SKAction.animateWithTextures(self.roleTestures, timePerFrame: 0.06)
        self.runAction(SKAction.repeatActionForever(run))
    }
    
    func stop(){
        self.removeAllActions()
        
    }

    
    /** -------------------------------------------EYE BEGIN---------------------------------------------- */
    func getEye() -> SKSpriteNode {
        let eye = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(5, 13))
        eye.anchorPoint = CGPointMake(0.5, 0.5)
        eye.zPosition = EYE_ZPOSITION
        return eye
    }
    
    func startEyeAction(){
        let close = SKAction.scaleXBy(1, y: 0.2, duration: 0.2)
        let open = close.reversedAction()
        let duration = SKAction.waitForDuration(5)
        let blink = SKAction.sequence([close,open,duration])
        self.leftEye.runAction(SKAction.repeatActionForever(blink))
        self.rightEye.runAction(SKAction.repeatActionForever(blink))
    }
    
    func stopEyeAction(){
        self.leftEye.removeAllActions()
        self.rightEye.removeAllActions()
        self.leftEye.position = CGPointMake(10, 10)
        self.rightEye.position = CGPointMake(35, 10)
    }
    /** -------------------------------------------EYE END---------------------------------------------- */
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
