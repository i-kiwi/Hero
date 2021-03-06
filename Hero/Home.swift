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
    var currentButtonName:NSString = ""
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
    // 商店
    var shop: Shop!
    // 背包
    var pack: Pack!
    // 手指点击或滑动时的Y轴
    var touchYPoint: CGFloat = 0
    // 手机滑动的增量
    var moveLength: CGFloat = 0
    // 上次点击的button按钮节点
    var lastBtnNode:SKShapeNode!
    // 上次点击的button的下标
    var lastBtnIndex:String!
    
    
    override func didMove(to view: SKView) {
        toViewInit()
//        UpAndDownSlide()
        
    }
    
    // to view init thing
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
        let btmBox = boxFactory.btmBox
        self.addChild(topBox!)
        self.addChild(midBox!)
        self.addChild(btmBox!)
        
        //init btm button
        let btnFactroy = ButtonFactory.getInstance()
        let btnArr = btnFactroy.btnArr
        for btn in btnArr! {
            self.addChild(btn)
        }
    }
    
    func UpAndDownSlide(){
//        let upSlide = UISwipeGestureRecognizer(target: self, action: Selector(self.upSlide()))
//        upSlide.direction = UISwipeGestureRecognizerDirection.up
//        self.view?.addGestureRecognizer(upSlide)
        
//        let downSlide = UISwipeGestureRecognizer(target: self, action: Selector(self.downSlide()))
//        downSlide.direction = UISwipeGestureRecognizerDirection.down
//        self.view?.addGestureRecognizer(downSlide)
        
    }
    
    // up slide
    func upSlide(){
        
    }
    // down slide
    func downSlide(){
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 初始化点击的Y轴位置
        self.touchYPoint = (touches.first?.location(in: self).y)!
        
        // 点击底部
        if let touchPosition = touches.first?.location(in: self.boxFactory.btmBox){
            let node = atPoint(touchPosition)
            
            if let name = node.name{
                // 点击按钮更换背景图片，并恢复上次点击的背景图片
                func btnAction(){
                    if let node = node as? SKShapeNode{
                        if let _ = self.lastBtnNode {
                            self.lastBtnNode.fillTexture = SKTexture(imageNamed: "btn\(self.lastBtnIndex)_0.png")
                            self.lastBtnNode.strokeColor = UIColor.black
                        }
                        self.lastBtnIndex = self.currentButtonName.substring(from: 6)
                        node.fillTexture = SKTexture(imageNamed: "btn\(self.lastBtnIndex)_1.png")
                        node.strokeColor = UIColor.white
                        self.lastBtnNode = node
                    }
                }
                // 底部按钮
                if name == "\(BUTTON_NAME)\(buttonIndexEnum.制造.rawValue)"{
                    if name != self.currentButtonName as String{
                        self.changeViewAction()
                        self.showMakingView()
                        self.currentButtonName = name as NSString
                        btnAction()
                    }
                }else if name == "\(BUTTON_NAME)\(buttonIndexEnum.探索.rawValue)" {
                    if name != self.currentButtonName as String{
                        self.changeViewAction()
                        self.showExploreView()
                        self.currentButtonName = name as NSString
                        btnAction()
                    }
                }else if name == "\(BUTTON_NAME)\(buttonIndexEnum.个人.rawValue)" {
                    if name != self.currentButtonName as String{
                        self.changeViewAction()
                        self.showStateView()
                        self.currentButtonName = name as NSString
                        btnAction()
                    }
                }else if name == "\(BUTTON_NAME)\(buttonIndexEnum.图册.rawValue)" {
                    if name != self.currentButtonName as String{
                        self.changeViewAction()
                        self.showMapView()
                        self.currentButtonName = name as NSString
                        btnAction()
                    }
                }else if name == "\(BUTTON_NAME)\(buttonIndexEnum.商店.rawValue)" {
                    if name != self.currentButtonName as String{
                        self.changeViewAction()
                        self.showShopView()
                        self.currentButtonName = name as NSString
                        btnAction()
                    }
                }else if name == "\(BUTTON_NAME)\(buttonIndexEnum.背包.rawValue)" {
                    if name != self.currentButtonName as String{
                        self.changeViewAction()
                        self.showPackView()
                        self.currentButtonName = name as NSString
                        btnAction()
                    }
                }
                
                
            }
        }
        
        
        // 点击中部
        if let touchPosition = touches.first?.location(in: self.boxFactory.midBox){
            if MathUtil.isInRange(touchPosition.y, range: (CONTENT_MODEL_MARGIN, BOTTOM_FRAME_HEIGHT)){
                let node = self.boxFactory.midBox.atPoint(touchPosition)
                
                if let name = node.name{
                    // 点击列表ico图标
                    if name.hasPrefix(GOODS_ICO_NAME){
                        if let a = Int(name.components(separatedBy: "-")[1]){
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
        self.boxFactory.midBox.run(SKAction.group([SKAction.scale(to: 1.05, duration: 0.1),SKAction.moveBy(x: -20, y: -20, duration: 0.1)]), completion: {
            self.boxFactory.midBox.run(SKAction.group([SKAction.scale(to: 1, duration: 0.1),SKAction.moveBy(x: 20, y: 20, duration: 0.1)]))
        })
    }
    
    // 制作窗口
    func showMakingView(){
        self.making = Making.getInstance()
        let makingBox = making.makingBox
        self.boxFactory.midBox.removeAllChildren()
        self.boxFactory.midBox.addChild(makingBox!)
    
    }
    // 探索窗口
    func showExploreView(){
        self.explore = Explore.getInstance()
        let exploreBox = explore.exploreBox
        self.boxFactory.midBox.removeAllChildren()
        self.boxFactory.midBox.addChild(exploreBox!)
    }
    // 个人状态窗口
    func showStateView(){
        self.state = State.getInstance()
        let stateBox = state.stateBox
        self.boxFactory.midBox.removeAllChildren()
        self.boxFactory.midBox.addChild(stateBox!)
    }
    // 地图窗口
    func showMapView(){
        self.map = Map.getInstance()
        let mapBox = map.mapBox
        self.boxFactory.midBox.removeAllChildren()
        self.boxFactory.midBox.addChild(mapBox!)
    }
    // 商店窗口
    func showShopView(){
        self.shop = Shop.getInstance()
        let shopBox = shop.shopBox
        self.boxFactory.midBox.removeAllChildren()
        self.boxFactory.midBox.addChild(shopBox!)
    }
    // 背包窗口
    func showPackView(){
        self.pack = Pack.getInstance()
        let packBox = pack.packBox
        self.boxFactory.midBox.removeAllChildren()
        self.boxFactory.midBox.addChild(packBox!)
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 手指移动的增量
        let touch = touches.first?.location(in: self)
        self.moveLength = 0
        func addMove(){
            self.moveLength = (touch?.y)! - self.touchYPoint
            self.touchYPoint = (touch?.y)!
        }
        
        if let node: SKNode = self.atPoint(touch!){
            
            if self.currentButtonName as String == "\(BUTTON_NAME)\(buttonIndexEnum.制造.rawValue)" && MathUtil.isInRange(touch?.y, range: (BTM_BOX_HEIGHT,MAKING_LIST_ABSOLUTED_HEIGHT)){
                if node.name == MAKING_TAINER_NAME{
                    if let makingTainer = node.parent as? SKShapeNode{
                        if makingTainer.position.y > self.making.listRange.top - LIST_SLIDE_RANGE && makingTainer.position.y < self.making.listRange.btm + LIST_SLIDE_RANGE{
                            addMove()
                            self.making.tainer.removeAllActions()
                            makingTainer.position.y += moveLength
                        }
                    }
                    
                }
            }else if self.currentButtonName as String == "\(BUTTON_NAME)\(buttonIndexEnum.图册.rawValue)" && MathUtil.isInRange(touch?.y, range: (BTM_BOX_HEIGHT,MAP_LIST_ABSOLUTED_HEIGHT)){
                if node.name == MAP_TAINER_NAME{
                    if let mapTainer = node.parent as? SKShapeNode{
                        if mapTainer.position.y > self.map.listRange.top - LIST_SLIDE_RANGE && mapTainer.position.y < self.map.listRange.btm + LIST_SLIDE_RANGE{
                            addMove()
                            self.map.tainer.removeAllActions()
                            mapTainer.position.y += moveLength
                        }
                    }
                    
                }
            }else if self.currentButtonName as String == "\(BUTTON_NAME)\(buttonIndexEnum.背包.rawValue)" && MathUtil.isInRange(touch?.y, range: (BTM_BOX_HEIGHT,MAP_LIST_ABSOLUTED_HEIGHT)){
                if node.name == PACK_TAINER_NAME{
                    if let packTainer = node.parent as? SKShapeNode{
                        if packTainer.position.y > self.pack.listRange.top - LIST_SLIDE_RANGE && packTainer.position.y < self.pack.listRange.btm + LIST_SLIDE_RANGE{
                            addMove()
                            self.pack.tainer.removeAllActions()
                            packTainer.position.y += moveLength
                        }
                    }
                    
                }
            }
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first?.locationInNode(self)
//        if let node: SKNode = self.nodeAtPoint(touch!){
        
        if self.currentButtonName as String == "\(BUTTON_NAME)\(buttonIndexEnum.制造.rawValue)"{
            self.making.bottomFrameTurnZero(self.moveLength)
        }else if self.currentButtonName as String == "\(BUTTON_NAME)\(buttonIndexEnum.图册.rawValue)"{
            self.map.bottomFrameTurnZero(self.moveLength)
        }else if self.currentButtonName as String == "\(BUTTON_NAME)\(buttonIndexEnum.背包.rawValue)"{
            self.pack.bottomFrameTurnZero(self.moveLength)
        }
        
//        // 点击底部
//        if let touchPosition = touches.first?.locationInNode(self.boxFactory.btmBox){
//            let nodeName = nodeAtPoint(touchPosition).name
//            nodeName?.substringToIndex
////        }
        
        
    }
    
    
    
}



