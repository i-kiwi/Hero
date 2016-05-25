//
//  Attack.swift
//  Hero
//
//  Created by i－Kiwi on 16/5/12.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class Attack: SKScene {
    
    var clickTime: CFTimeInterval = 0
    
    let boxFactory = BoxFactory.getInstance()
    let attackFactory = AttackPanelFactory.getInstance()
    let hero = RoleTexture.getInstance()
    // 准星上下浮动范围
    let gunButtonRange:(top: CGFloat, btm: CGFloat) = (BTM_BOX_HEIGHT / 2 + 200,BTM_BOX_HEIGHT / 2 - 200)
    // 当前点击的按钮
    var currentClickButton: SKNode!
    
    
    override func didMoveToView(view: SKView) {
        toViewInit()
//
        let tap = UITapGestureRecognizer(target: self, action: #selector(ee))
        tap.numberOfTapsRequired = 2
//        self.view?.addGestureRecognizer(tap)
        self.hero.inputView?.addGestureRecognizer(tap)
        
        print("\(self.hero.inputAccessoryViewController)")
    }
    func ee(){
        print("ee")
    }
    
    func toViewInit(){
        // init self scene
        self.size = SCENE_SIZE
        self.anchorPoint = CGPointMake(0, 0)
        self.backgroundColor = UIColor.whiteColor()
        
        // init background
        let boxBack = self.boxFactory.backBox
        self.addChild(boxBack)
        
        // init top/mid/btm box
        let topBox = boxFactory.topBox
        let midBox = boxFactory.midBox
        let containerBox = boxFactory.getModuleContainerBox()
        midBox.addChild(containerBox)
        containerBox.addChild(hero)
        hero.position = CGPointMake(containerBox.frame.width / 2, containerBox.frame.height / 2)
        hero.stop()
        let btmBox = boxFactory.btmBox
        self.addChild(topBox)
        self.addChild(midBox)
        self.addChild(btmBox)
        
        initAttackPanel()
    }
    
    // 初始化攻击面板
    func initAttackPanel(){
        // 背景面板
        attackFactory.attackButton.position = CGPointMake(boxFactory.btmBox.frame.width / 2, boxFactory.btmBox.frame.height / 2)
        attackFactory.upButton.position = CGPointMake(boxFactory.btmBox.frame.width / 2, 510)
        attackFactory.downButton.position = CGPointMake(boxFactory.btmBox.frame.width / 2, 90)
        attackFactory.leftButton.position = CGPointMake(320, boxFactory.btmBox.frame.height / 2)
        attackFactory.rightButton.position = CGPointMake(760, boxFactory.btmBox.frame.height / 2)
        attackFactory.pack1.position = CGPointMake(140, 400)
        attackFactory.pack2.position = CGPointMake(140, 200)
        attackFactory.gunSlide.position = CGPointMake(930, boxFactory.btmBox.frame.height / 2)
        attackFactory.gunButton.position = CGPointMake(930, self.gunButtonRange.btm)
        
        
        boxFactory.btmBox.addChild(attackFactory.attackButton)
        boxFactory.btmBox.addChild(attackFactory.upButton)
        boxFactory.btmBox.addChild(attackFactory.downButton)
        boxFactory.btmBox.addChild(attackFactory.leftButton)
        boxFactory.btmBox.addChild(attackFactory.rightButton)
        boxFactory.btmBox.addChild(attackFactory.pack1)
        boxFactory.btmBox.addChild(attackFactory.pack2)
        boxFactory.btmBox.addChild(attackFactory.gunSlide)
        boxFactory.btmBox.addChild(attackFactory.gunButton)
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let node = self.nodeAtPoint((touches.first?.locationInNode(self.boxFactory.btmBox))!)
        // 如果当前点击的按钮不是上一次点击的按钮则重置
        if self.currentClickButton != node{
            self.currentClickButton = nil
        }
        // 如果点击的是方向键、攻击按钮、物品栏等 TODO
        if let isBtn = node.name?.hasSuffix("_flag_")  {
            if !isBtn{
                return
            }
            // 这次点击的时间
            let nowClickTime = CACurrentMediaTime()
            
            if node.name == attackButtonName.attack.rawValue{// 攻击按钮
                print("attack!")
            }else if node.name == attackButtonName.gun.rawValue{// 射击按钮
                print("fire!")
            }else if node.name == attackButtonName.up.rawValue{// 上
                print("up!")
            }else if node.name == attackButtonName.down.rawValue{// 下
                print("down!")
            }else if node.name == attackButtonName.left.rawValue{// 左
                if self.currentClickButton != nil && nowClickTime - self.clickTime < 1{
                    print("double left!")
                    
                    self.clickTime = 0
                }else{
                    
                    print("left!")
                    // 记录这次点击的时间
                    self.clickTime = nowClickTime
                }
            }else if node.name == attackButtonName.right.rawValue{// 右
                print("right!")
            }else if node.name == attackButtonName.pack1.rawValue{// 物品1
                print("pack1!")
            }else if node.name == attackButtonName.pack2.rawValue{// 物品2
                print("pack2!")
            }
            // 点击动画
            node.runAction(attackFactory.attackBeganAction())
            // 记录这次点击的按钮
            self.currentClickButton = node
        }
        
        
//        if let _ = node{
//            let nowClickTime = CACurrentMediaTime()
//            if nowClickTime - self.clickTime < 1 {
//                //1秒内双击
//                print("double+")
//            }
//            self.clickTime = nowClickTime
//        }
        
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        let node = self.nodeAtPoint((touches.first?.locationInNode(self.boxFactory.btmBox))!)
        
        if let _ = self.currentClickButton{
            self.currentClickButton.runAction(attackFactory.attackEndedAction())
//            // 重置当前点击的按钮为空
//            self.currentClickButton = nil
        }
    }
}
