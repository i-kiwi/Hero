//
//  HeroFactory.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/20.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class HeroRunFactory: SKSpriteNode {
    
    var leftLeg: SKSpriteNode!
    var rightLeg: SKSpriteNode!
    var arm: SKSpriteNode!
    var leftEye: SKSpriteNode!
    var rightEye: SKSpriteNode!
    
    let single: String!
    static var instance: HeroRunFactory!
    class func getInstance() -> HeroRunFactory{
        if let factory = instance{
            return factory
        }else{
            instance = HeroRunFactory()
            return instance!
        }
    }

    init(){
        self.single = "the single model"
        let texture = SKTexture(imageNamed: "body")
        let size = CGSize(width: texture.size().width, height: texture.size().height)
        super.init(texture:texture,color:SKColor.white,size:size)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = 100
        
        //eye
        self.leftEye = self.getEye()
        self.rightEye = self.getEye()
        self.stopEyeAction()
        self.addChild(leftEye)
        self.addChild(rightEye)
        self.startEyeAction()
        // leg
        self.leftLeg = self.getLeg()
        self.rightLeg = self.getLeg()
        self.stopLegAction()
        self.addChild(leftLeg)
        self.addChild(rightLeg)
        //arm
        self.arm = self.getArm()
        self.stopArmAction()
        self.addChild(arm)
    }
    
    
    
    /** -------------------------------------------BODY BEGIN---------------------------------------------- */
    func startBodyJumpAction(){
        let jump1 = SKAction.moveBy(x: 0, y: 2, duration: 0.2)
        let jump2 = jump1.reversed()
        self.run(SKAction.repeatForever(SKAction.sequence([jump1,jump2])))
    }
    
    func stopBodyJumpAction(){
        self.removeAllActions()
    }
    /** -------------------------------------------BODY END---------------------------------------------- */
    
    
    
    
    /** -------------------------------------------EYE BEGIN---------------------------------------------- */
    func getEye() -> SKSpriteNode {
        let eye = SKSpriteNode(color: UIColor.black, size: CGSize(width: 5, height: 13))
        eye.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        eye.zPosition = EYE_ZPOSITION
        return eye
    }
    
    func startEyeAction(){
        let close = SKAction.scaleX(by: 1, y: 0.2, duration: 0.2)
        let open = close.reversed()
        let duration = SKAction.wait(forDuration: 5)
        let blink = SKAction.sequence([close,open,duration])
        self.leftEye.run(SKAction.repeatForever(blink))
        self.rightEye.run(SKAction.repeatForever(blink))
    }
    
    func stopEyeAction(){
        self.leftEye.removeAllActions()
        self.rightEye.removeAllActions()
        self.leftEye.position = CGPoint(x: 10, y: 10)
        self.rightEye.position = CGPoint(x: 35, y: 10)
    }
    /** -------------------------------------------EYE END---------------------------------------------- */

    
    
    
    /** -------------------------------------------LEG BEGIN---------------------------------------------- */
    // start leg action
    func startLegAction(){
        let runAction1 = SKAction.rotate(byAngle: CGFloat(M_PI_4), duration: 0.2)
        runAction1.timingMode = SKActionTimingMode.easeInEaseOut
        let runAction2 = runAction1.reversed()
        let sequence1 = SKAction.sequence([runAction1,runAction2])
        let sequence2 = SKAction.sequence([runAction2,runAction1])
        
        self.leftLeg.run(SKAction.repeatForever(sequence1), withKey: "leftLegAction")
        self.rightLeg.run(SKAction.repeatForever(sequence2), withKey: "rightLegAction")
    }
    
    // stop leg action
    func stopLegAction(){
        self.leftLeg.removeAllActions()
        self.rightLeg.removeAllActions()
        self.leftLeg.position = CGPoint(x: -4, y: -52)
        self.rightLeg.position = CGPoint(x: 8, y: -52)
        self.leftLeg.zRotation = 0
        self.rightLeg.zRotation = 0
    }
    
    
    // get leg
    func getLeg() -> SKSpriteNode {
        let leg = SKSpriteNode(color: UIColor.black, size: CGSize(width: 6, height: 14))
        leg.anchorPoint = CGPoint(x: 0.5, y: 2)
        leg.zPosition = LEG_ZPOSITION
        return leg
    }
    /** -------------------------------------------LEG END---------------------------------------------- */
    
    
    /** -------------------------------------------ARM BEGIN---------------------------------------------- */
    func getArm() -> SKSpriteNode {
        let arm = SKSpriteNode(color: UIColor.black, size: CGSize(width: 3, height: 20))
        arm.anchorPoint = CGPoint(x: 0.5, y: 1)
        arm.zPosition = ARM_ZPOSITION
        return arm
    }
    
    func startArmAction(){
        self.arm.zRotation = -0.5
        let runAction1 = SKAction.rotate(byAngle: CGFloat(M_PI_2), duration: 0.2)
        runAction1.timingMode = SKActionTimingMode.easeInEaseOut
        let runAction2 = runAction1.reversed()
        let sequence1 = SKAction.sequence([runAction1,runAction2])
        self.arm.run(SKAction.repeatForever(sequence1),withKey: "armAction")
    }
    
    func stopArmAction(){
        self.arm.removeAllActions()
        self.arm.position = CGPoint(x: -6, y: -35)
        self.arm.zRotation = 0
    }
    /** -------------------------------------------ARM END---------------------------------------------- */
    
    func run(){
        self.stop()
        self.startLegAction()
        self.startArmAction()
        self.startBodyJumpAction()
    }
    
    func slowRun(){
        let armAction = self.arm.action(forKey: "armAction")
        let leftLegAction = self.leftLeg.action(forKey: "leftLegAction")
        let rightLegAction = self.rightLeg.action(forKey: "rightLegAction")
        self.stopBodyJumpAction()
        
        armAction?.speed = SLOW_RUN_SPEED
        leftLegAction?.speed = SLOW_RUN_SPEED
        rightLegAction?.speed = SLOW_RUN_SPEED
    }
    
    func stop(){
        self.stopLegAction()
        self.stopArmAction()
        self.stopBodyJumpAction()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
