//
//  Constant.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/20.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit


//Size
let SCENE_SIZE: CGSize = CGSizeMake(1080, 1920)



//Width
let BOX_LINE_WIDTH:CGFloat = 5
let BOX_LINE_MARGIN:CGFloat = 15
let TOP_BOX_HEIGHT:CGFloat = 150
let MID_BOX_HEIGHT:CGFloat = 1040
let BTM_BOX_HEIGHT:CGFloat = 700


let BUTTON_LINE_WIDTH:CGFloat = 5
let BUTTON_WIDTH:CGFloat = 200
let BUTTON_HEIGHT:CGFloat = 190




//Radius
let BUTTON_RADIUS: CGFloat = 50



// ZPosition
let BODY_ZPOSITION: CGFloat = 100
let LEG_ZPOSITION: CGFloat = -1
let ARM_ZPOSITION: CGFloat = 99
let EYE_ZPOSITION: CGFloat = 99
let BOX_ZPOSITION: CGFloat = 1
let BOX_LINE_ZPOSITION: CGFloat = 5
let BUTTON_ZPOSITION:CGFloat = 5


// Speed
let SLOW_RUN_SPEED: CGFloat = 0.5



//Color
let BOX_LINE_COLOR = UIColor.blackColor()
let BOX_LINE_FILL_COLOR = UIColor.whiteColor()

let BUTTON_LINE_COLOR = UIColor.blackColor()
let BUTTON_FILL_COLOR = UIColor.whiteColor()



//Button enum
enum buttonIndexEnum: Int {
    case 个人 = 0
    case 图册 = 1
    case 探索 = 2
    case 制造 = 3
    case 商店 = 4
    case 物品 = 5
    case 部落 = 6
    case 掠夺 = 7
}
