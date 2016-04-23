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
        let texture = SKTexture(imageNamed: "body")
        let size = CGSizeMake(texture.size().width, texture.size().height)
        super.init(texture:texture,color:SKColor.whiteColor(),size:size)
        self.anchorPoint = CGPointMake(0.5, 0.5)
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
        let jump1 = SKAction.moveByX(0, y: 2, duration: 0.2)
        let jump2 = jump1.reversedAction()
        self.runAction(SKAction.repeatActionForever(SKAction.sequence([jump1,jump2])))
    }
    
    func stopBodyJumpAction(){
        self.removeAllActions()
    }
    /** -------------------------------------------BODY END---------------------------------------------- */
    
    
    
    
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
        self.leftEye.position = CGPointMake(10, 14)
        self.rightEye.position = CGPointMake(35, 14)
    }
    /** -------------------------------------------EYE END---------------------------------------------- */

    
    
    
    /** -------------------------------------------LEG BEGIN---------------------------------------------- */
    // start leg action
    func startLegAction(){
        let runAction1 = SKAction.rotateByAngle(CGFloat(M_PI_4), duration: 0.2)
        runAction1.timingMode = SKActionTimingMode.EaseInEaseOut
        let runAction2 = runAction1.reversedAction()
        let sequence1 = SKAction.sequence([runAction1,runAction2])
        let sequence2 = SKAction.sequence([runAction2,runAction1])
        
        self.leftLeg.runAction(SKAction.repeatActionForever(sequence1), withKey: "leftLegAction")
        self.rightLeg.runAction(SKAction.repeatActionForever(sequence2), withKey: "rightLegAction")
    }
    
    // stop leg action
    func stopLegAction(){
        self.leftLeg.removeAllActions()
        self.rightLeg.removeAllActions()
        self.leftLeg.position = CGPointMake(-4, -58)
        self.rightLeg.position = CGPointMake(8, -58)
        self.leftLeg.zRotation = 0
        self.rightLeg.zRotation = 0
    }
    
    
    // get leg
    func getLeg() -> SKSpriteNode {
        let leg = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(6, 14))
        leg.anchorPoint = CGPointMake(0.5, 2)
        leg.zPosition = LEG_ZPOSITION
        return leg
    }
    /** -------------------------------------------LEG END---------------------------------------------- */
    
    
    /** -------------------------------------------ARM BEGIN---------------------------------------------- */
    func getArm() -> SKSpriteNode {
        let arm = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(3, 20))
        arm.anchorPoint = CGPointMake(0.5, 1)
        arm.zPosition = LEG_ZPOSITION
        return arm
    }
    func startArmAction(){
        self.arm.zRotation = -0.5
        let runAction1 = SKAction.rotateByAngle(CGFloat(M_PI_2), duration: 0.2)
        runAction1.timingMode = SKActionTimingMode.EaseInEaseOut
        let runAction2 = runAction1.reversedAction()
        let sequence1 = SKAction.sequence([runAction1,runAction2])
        self.arm.runAction(SKAction.repeatActionForever(sequence1),withKey: "armAction")
    }
    
    func stopArmAction(){
        self.arm.removeAllActions()
        self.arm.position = CGPointMake(-6, -35)
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
        let armAction = self.arm.actionForKey("armAction")
        let leftLegAction = self.leftLeg.actionForKey("leftLegAction")
        let rightLegAction = self.rightLeg.actionForKey("rightLegAction")
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
