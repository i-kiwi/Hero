//
//  Role.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/24.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class Role: NSObject {

    var name: String!
    var level: Int!
    
    // 有权限的物品
    var entitledGoods: [Goods] = []
    // 拥有的物品
    var hasGoods: [Goods] = []
    // 穿戴的物品
    var wearingGoods = NSMutableDictionary()
    // 物品数量上限
    var goodsCountUpperLimit: Int!
    // 图册
    var placeMap: [Place] = []
    // 是否准备好下个动作
    var isReady: Bool = true
    // 技能列表
    var skills = NSMutableDictionary()
//    // 攻击状态
    var attackState: Int = 0 {
        didSet{
            if self.attackState > 3{
                self.attackState = 0
            }
        }
    }
    
//    var goodsVerson: String!
    
    let single:String!
    static var role:Role!
    class func getInstance() -> Role {
        if let instance = self.role{
            return instance
        }else{
            role = Role()
            return role
        }
    }
    
    override init(){
        self.single = "the single model"
        
        // loading role attribute
        self.name = "kiwi"
        self.level = 1
        self.goodsCountUpperLimit = 50
        
//        self.wearingGoods = NSMutableDictionary()
//        self.goodsVerson = "0.1"
        super.init()
        
        
        
        //测试物品数据
        for index in 0 ..< 20{
            let goods = Food()
            goods.name = "初级红药水"
            goods.ico = SKTexture(imageNamed: "btn\(index % 8).jpg")
            goods.attribute = "+20生命值"
            goods.detail = "简易配置的红药水"
            goods.time = 20
            
            self.entitledGoods.append(goods)
        }
        let hairGoods = Goods()
        hairGoods.ico = SKTexture(imageNamed: "btn3.jpg")
        
        self.wearingGoods.setValue(hairGoods, forKey: GUN_EQUIP_NAME)
        //测试图册数据
        for index in 0 ..< 20{
            let place = Place()
            place.name = "原始森林"
            place.ico = SKTexture(imageNamed: "btn\(index % 8).jpg")
            place.detail = "XXXXXX"
            place.starLV = 3
            place.hasStar = index < 10 ? -1 : 0
            self.placeMap.append(place)
        }
        //技能
        self.skills.setValue(Skill(name: SkillName.downBlock.rawValue, cd: 1), forKey: SkillName.downBlock.rawValue)
        self.skills.setValue(Skill(name: SkillName.afterTheJump.rawValue, cd: 1), forKey: SkillName.afterTheJump.rawValue)
        self.skills.setValue(Skill(name: SkillName.beforeTheJump.rawValue, cd: 1), forKey: SkillName.beforeTheJump.rawValue)
        
        
    }
}
