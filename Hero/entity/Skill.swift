//
//  Skill.swift
//  Hero
//
//  Created by i－Kiwi on 16/5/26.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import UIKit

// 技能
class Skill: NSObject {

    var name: String!
    var cd: CFTimeInterval!
    var power: CGFloat!
    var lastTime: CFTimeInterval = 0
    
    init(name: String, cd: CFTimeInterval, power: CGFloat = 0) {
        self.name = name
        self.cd = cd
        self.power = power
    }
}
