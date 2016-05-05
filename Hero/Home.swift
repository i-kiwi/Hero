//
//  GameScene.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/20.
//  Copyright (c) 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class Home: SKScene {
    
    // 角色
    let role = Role.getInstance()
    // curren button name
    var currentButtonName:String = ""
    // hero texture
    var hero: HeroStateFactory!
    // every box
    let boxFactory = BoxFactory.getInstance()
    // 制作
    var making:Making!
    // 探索
    var explore:Explore!
    // 状态
    var state:State!
    // 地图
    var map: Map!
    // 手指点击或滑动时的Y轴
    var touchYPoint: CGFloat = 0
    // 手机滑动的增量
    var moveLength: CGFloat = 0
    
    
    override func didMoveToView(view: SKView) {
        toViewInit()
//        UpAndDownSlide()
        
    }
    
    // to view init thing
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
        let btmBox = boxFactory.btmBox
        self.addChild(topBox)
        self.addChild(midBox)
        self.addChild(btmBox)
        
        //init btm button
        let btnFactroy = ButtonFactory.getInstance()
        let btnArr = btnFactroy.btnArr
        for btn in btnArr {
            self.addChild(btn)
        }
    }
    
    func UpAndDownSlide(){
        let upSlide = UISwipeGestureRecognizer(target: self, action: Selector(self.upSlide()))
        upSlide.direction = UISwipeGestureRecognizerDirection.Up
        self.view?.addGestureRecognizer(upSlide)
        
        let downSlide = UISwipeGestureRecognizer(target: self, action: Selector(self.downSlide()))
        downSlide.direction = UISwipeGestureRecognizerDirection.Down
        self.view?.addGestureRecognizer(downSlide)
        
    }
    
    // up slide
    func upSlide(){
        
    }
    // down slide
    func downSlide(){
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 初始化点击的Y轴位置
        self.touchYPoint = (touches.first?.locationInNode(self).y)!
        
        // 点击底部
        if let touchPosition = touches.first?.locationInNode(self.boxFactory.btmBox){
            let node = nodeAtPoint(touchPosition)
            
            if let name = node.name{
                // 底部制造按钮
                if name == "\(BUTTON_NAME)\(buttonIndexEnum.制造.rawValue)"{
                    if name != self.currentButtonName{
                        self.changeViewAction()
                        self.showMakingView()
                        self.currentButtonName = name
                    }
                }else if name == "\(BUTTON_NAME)\(buttonIndexEnum.探索.rawValue)" {
                    if name != self.currentButtonName{
                        self.changeViewAction()
                        self.showExploreView()
                        self.currentButtonName = name
                    }
                }else if name == "\(BUTTON_NAME)\(buttonIndexEnum.个人.rawValue)" {
                    if name != self.currentButtonName{
                        self.changeViewAction()
                        self.showStateView()
                        self.currentButtonName = name
                    }
                }else if name == "\(BUTTON_NAME)\(buttonIndexEnum.图册.rawValue)" {
                    if name != self.currentButtonName{
                        self.changeViewAction()
                        self.showMapView()
                        self.currentButtonName = name
                    }
                }
            }
        }
        
        
        // 点击中部
        if let touchPosition = touches.first?.locationInNode(self.boxFactory.midBox){
            if MathUtil.isInRange(touchPosition.y, range: (CONTENT_MODEL_MARGIN, BOTTOM_FRAME_HEIGHT)){
                let node = self.boxFactory.midBox.nodeAtPoint(touchPosition)
                
                if let name = node.name{
                    // 点击列表ico图标
                    if name.hasPrefix(GOODS_ICO_NAME){
                        if let a = Int(name.componentsSeparatedByString("-")[1]){
                            NSLog("\(a)")
//                            let goods = self.role.entitledGoods[a]
//                            let action = SKAction.resizeToWidth(300, duration: 0.3)
//                            goods.timeFrame.runAction(action)
                        }
                    }
                }
            }
        }
        
        
    }
    
    // 切换窗口动画
    func changeViewAction(){
//        let a = SKAction.moveByX(-50, y: -50, duration: 0.1)
        self.boxFactory.midBox.runAction(SKAction.group([SKAction.scaleTo(1.05, duration: 0.1),SKAction.moveByX(-20, y: -20, duration: 0.1)]), completion: {
            self.boxFactory.midBox.runAction(SKAction.group([SKAction.scaleTo(1, duration: 0.1),SKAction.moveByX(20, y: 20, duration: 0.1)]))
        })
    }
    
    // 制作窗口
    func showMakingView(){
        self.making = Making.getInstance()
        let makingBox = making.makingBox
        self.boxFactory.midBox.removeAllChildren()
        self.boxFactory.midBox.addChild(makingBox)
    
    }
    // 探索窗口
    func showExploreView(){
        self.explore = Explore.getInstance()
        let exploreBox = explore.exploreBox
        self.boxFactory.midBox.removeAllChildren()
        self.boxFactory.midBox.addChild(exploreBox)
    }
    // 个人状态窗口
    func showStateView(){
        self.state = State.getInstance()
        let stateBox = state.stateBox
        self.boxFactory.midBox.removeAllChildren()
        self.boxFactory.midBox.addChild(stateBox)
    }
    // 地图窗口
    func showMapView(){
        self.map = Map.getInstance()
        let mapBox = map.mapBox
        self.boxFactory.midBox.removeAllChildren()
        self.boxFactory.midBox.addChild(mapBox)
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 手指移动的增量
        let touch = touches.first?.locationInNode(self)
        self.moveLength = 0
        func addMove(){
            self.moveLength = (touch?.y)! - self.touchYPoint
            self.touchYPoint = (touch?.y)!
        }
        
        if let node: SKNode = self.nodeAtPoint(touch!){
            
            if self.currentButtonName == "\(BUTTON_NAME)\(buttonIndexEnum.制造.rawValue)" && MathUtil.isInRange(touch?.y, range: (BTM_BOX_HEIGHT,MAKING_LIST_ABSOLUTED_HEIGHT)){
                if node.name == MAKING_TAINER_NAME{
                    if let makingTainer = node.parent as? SKShapeNode{
                        if makingTainer.position.y > self.making.listRange.top - LIST_SLIDE_RANGE && makingTainer.position.y < self.making.listRange.btm + LIST_SLIDE_RANGE{
                            addMove()
                            self.making.tainer.removeAllActions()
                            makingTainer.position.y += moveLength
                        }
                    }
                    
                }
            }else if self.currentButtonName == "\(BUTTON_NAME)\(buttonIndexEnum.图册.rawValue)" && MathUtil.isInRange(touch?.y, range: (BTM_BOX_HEIGHT,MAP_LIST_ABSOLUTED_HEIGHT)){
                if node.name == MAP_TAINER_NAME{
                    if let mapTainer = node.parent as? SKShapeNode{
                        if mapTainer.position.y > self.map.listRange.top - LIST_SLIDE_RANGE && mapTainer.position.y < self.map.listRange.btm + LIST_SLIDE_RANGE{
                            addMove()
                            self.map.tainer.removeAllActions()
                            mapTainer.position.y += moveLength
                        }
                    }
                    
                }
            }
            
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        let touch = touches.first?.locationInNode(self)
//        if let node: SKNode = self.nodeAtPoint(touch!){
        
        if self.currentButtonName == "\(BUTTON_NAME)\(buttonIndexEnum.制造.rawValue)"{
            self.making.bottomFrameTurnZero(self.moveLength)
        }else if self.currentButtonName == "\(BUTTON_NAME)\(buttonIndexEnum.图册.rawValue)"{
            self.map.bottomFrameTurnZero(self.moveLength)
        }
        
        
        
    }
    
    
    
}



