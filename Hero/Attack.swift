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
    let role = Role.getInstance()
    // 准星上下浮动范围
    let gunButtonRange:(top: CGFloat, btm: CGFloat) = (BTM_BOX_HEIGHT / 2 + 180,BTM_BOX_HEIGHT / 2 - 180)
    // 当前点击的按钮
    var currentClickButton: SKNode!
    
    
    override func didMove(to view: SKView) {
        toViewInit()
        
    }
    func initTapRequire(){
        
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(single))
        
        self.view?.addGestureRecognizer(tap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(double))
        doubleTap.numberOfTapsRequired = 2
        self.view?.addGestureRecognizer(doubleTap)
        
        let threeTap = UITapGestureRecognizer(target: self, action: #selector(three))
        threeTap.numberOfTapsRequired = 3
        self.view?.addGestureRecognizer(threeTap)
        
        
        tap.require(toFail: doubleTap)
        doubleTap.require(toFail: threeTap)
    }
    
    func toViewInit(){
        // init self scene
        self.size = SCENE_SIZE
        
        self.anchorPoint = CGPoint(x: 0, y: 0)
        self.backgroundColor = UIColor.white
        
        // init background
        let boxBack = self.boxFactory.backBox
        self.addChild(boxBack!)
        
        // init top/mid/btm box
        let topBox = boxFactory.topBox
        let midBox = boxFactory.midBox
        let containerBox = boxFactory.getModuleContainerBox()
        midBox?.addChild(containerBox)
        containerBox.addChild(hero)
        hero.position = CGPoint(x: containerBox.frame.width / 2, y: containerBox.frame.height / 2)
        hero.stop()
        let btmBox = boxFactory.btmBox
        self.addChild(topBox!)
        self.addChild(midBox!)
        self.addChild(btmBox!)
        
        initAttackPanel()
    }
    
    // 初始化攻击面板
    func initAttackPanel(){
        // 背景面板
        attackFactory.attackButton.position = CGPoint(x: boxFactory.btmBox.frame.width / 2, y: boxFactory.btmBox.frame.height / 2)
        attackFactory.upButton.position = CGPoint(x: boxFactory.btmBox.frame.width / 2, y: 500)
        attackFactory.downButton.position = CGPoint(x: boxFactory.btmBox.frame.width / 2, y: 100)
        attackFactory.leftButton.position = CGPoint(x: 335, y: boxFactory.btmBox.frame.height / 2)
        attackFactory.rightButton.position = CGPoint(x: 745, y: boxFactory.btmBox.frame.height / 2)
        attackFactory.pack1.position = CGPoint(x: 140, y: 450)
        attackFactory.pack2.position = CGPoint(x: 140, y: 150)
        attackFactory.gunSlide.position = CGPoint(x: 940, y: boxFactory.btmBox.frame.height / 2)
        attackFactory.gunButton.position = CGPoint(x: 940, y: self.gunButtonRange.btm)
        
        
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
    
    
    func single(){
//        print("single")
        self.role.attackState = 0
    }
    func double(){
        print("double")
    }
    func three(){
        print("three")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

//        if let touch = touches.first?.tapCount{
//            switch touch {
//            case 1:
//                self.performSelector(#selector(single), withObject: nil, afterDelay: 0.4)
//                break
//            case 2:
//                NSObject.cancelPreviousPerformRequestsWithTarget(self, selector: #selector(single), object: nil)
//                self.performSelector(#selector(double), withObject: nil, afterDelay: 0.4)
//                break
//            default:
//                break
//            }
//        }
        
        
        
        
        
        let node = self.atPoint((touches.first?.location(in: self.boxFactory.btmBox))!)
        // 如果当前点击的按钮不是上一次点击的按钮则重置
        if self.currentClickButton != node{
            self.currentClickButton = nil
        }
        // 如果点击的是方向键、攻击按钮、物品栏等 TODO
        if let isBtn = node.name?.hasSuffix("_flag")  {
            if !isBtn || !self.role.isReady{
                return
            }
            // 这次点击的时间
            let nowClickTime = CACurrentMediaTime()
            
            if node.name == attackButtonName.attack.rawValue{// 攻击按钮
                print("\(self.role.attackState)")
                self.role.attackState += 1
                // 未中断
                NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(single), object: nil)
                // 超时中断当前连续动作
                self.perform(#selector(single), with: nil, afterDelay: TimeManager.attackSkillEndTime.rawValue)
            }else if node.name == attackButtonName.gun.rawValue{// 射击按钮
                print("fire!")
            }else if node.name == attackButtonName.up.rawValue{// 上
                print("up!")
            }else if node.name == attackButtonName.down.rawValue{// 下
                print("down!")
            }else if node.name == attackButtonName.left.rawValue{// 左
                if self.currentClickButton != nil && nowClickTime - self.clickTime < TimeManager.doubleClickTime.rawValue{
                    if let skill = self.role.skills.value(forKey: SkillName.afterTheJump.rawValue) as? Skill{
                        if nowClickTime - skill.lastTime > skill.cd{
                            skill.lastTime = nowClickTime
                            print("double left!")
                        }
                    }
                    self.clickTime = 0
                }else{
                    
//                    print("left!")
                    // 记录这次点击的时间
                    self.clickTime = nowClickTime
                }
            }else if node.name == attackButtonName.right.rawValue{// 右
                if self.currentClickButton != nil && nowClickTime - self.clickTime < TimeManager.doubleClickTime.rawValue{
                    if let skill = self.role.skills.value(forKey: SkillName.beforeTheJump.rawValue) as? Skill{
                        if nowClickTime - skill.lastTime > skill.cd{
                            skill.lastTime = nowClickTime
                            print("double right!")
                        }
                    }
                    self.clickTime = 0
                }else{
                    // 记录这次点击的时间
                    self.clickTime = nowClickTime
                }
            }else if node.name == attackButtonName.pack1.rawValue{// 物品1
                print("pack1!")
            }else if node.name == attackButtonName.pack2.rawValue{// 物品2
                print("pack2!")
            }
            // 点击动画
            node.run(attackFactory.attackBeganAction())
            // 记录这次点击的按钮
            self.currentClickButton = node
        }

        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let node = self.nodeAtPoint((touches.first?.locationInNode(self.boxFactory.btmBox))!)
        
        if let _ = self.currentClickButton{
            self.currentClickButton.run(attackFactory.attackEndedAction())
//            // 重置当前点击的按钮为空
//            self.currentClickButton = nil
        }
    }
}
