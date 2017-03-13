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
        let size = CGSize(width: texture.size().width, height: texture.size().height)
        super.init(texture:texture,color:SKColor.white,size:size)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
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
        let run = SKAction.animate(with: self.roleTestures, timePerFrame: 0.06)
        self.run(SKAction.repeatForever(run))
    }
    
    func stop(){
        self.removeAllActions()
        
    }

    
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
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
