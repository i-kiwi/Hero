//
//  Constant.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/20.
// HELLO WORLD
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit


/**
 * Size
 */
let SCENE_SIZE: CGSize = CGSize(width: 1080, height: 1920)



/**
 * Width
 */
let BOX_LINE_WIDTH:CGFloat = 5
let BOX_LINE_MARGIN:CGFloat = 15

let TOP_BOX_HEIGHT:CGFloat = 150
let MID_BOX_HEIGHT:CGFloat = 1140
let BTM_BOX_HEIGHT:CGFloat = 600

let BUTTON_LINE_WIDTH:CGFloat = 5
let BUTTON_WIDTH:CGFloat = 180
let BUTTON_HEIGHT:CGFloat = 180

// container
let FRAME_MARGIN:CGFloat = 90
let TOP_FRAME_HEIGHT: CGFloat = 220
let BOTTOM_FRAME_HEIGHT: CGFloat = 660
let BIG_FRAME_HEIGHT: CGFloat = 970
let FRAME_LINE_WIDTH:CGFloat = 5
// content
let CONTENT_MODEL_MARGIN: CGFloat = 50
let MAKING_CONTENT_MODEL_HEIGHT: CGFloat = 200
let MAP_CONTENT_MODEL_HEIGHT: CGFloat = 280
let CONTENT_MODEL_WIDTH: CGFloat = SCENE_SIZE.width - FRAME_MARGIN * 2 - CONTENT_MODEL_MARGIN * 2 - 5
// list
let LIST_ICO_NODE_WIDTH: CGFloat = 150
let LIST_ICO_NODE_LINE_WIDTH: CGFloat = 5
// 内容列表滑动范围
let LIST_SLIDE_RANGE: CGFloat = 200
// 内容列表顶部距离手机底部的距离
let MAKING_LIST_ABSOLUTED_HEIGHT: CGFloat = BTM_BOX_HEIGHT + BOTTOM_FRAME_HEIGHT + FRAME_MARGIN * 2
let MAP_LIST_ABSOLUTED_HEIGHT: CGFloat = BTM_BOX_HEIGHT + BIG_FRAME_HEIGHT + FRAME_MARGIN * 2
// 背包
let PACK_GOODS_FRAME_WIDTH: CGFloat = 150
let PACK_GOODS_FRAME_MARGIN: CGFloat = 10
let PACK_GOODS_ROW_SIZE: CGFloat = 5

/**
 * Radius
 */
let HOME_BOX_RADIUS: CGFloat = 10
let BUTTON_RADIUS: CGFloat = 50

let FRAME_RADIUS: CGFloat = 50



/**
 * ZPosition
 */

// hero
let BODY_ZPOSITION: CGFloat = 100
let LEG_ZPOSITION: CGFloat = -1
let ARM_ZPOSITION: CGFloat = 99
let EYE_ZPOSITION: CGFloat = 99

// box
let BOX_ZPOSITION: CGFloat = 1
let BOX_LINE_ZPOSITION: CGFloat = 5
let BUTTON_ZPOSITION:CGFloat = 5

// attack
let ATTACK_PANEL_ZPOSITION:CGFloat = 10

//making box
let CONTAINER_BOX_ZPOSITION:CGFloat = 10
let CONTAINER_BOX_LINE_ZPOSITION:CGFloat = 12
let FRAME_ZPOSITION: CGFloat = 14
let CONTENT_ZPOSITION: CGFloat = 16
let FRAME_LINE_ZPOSITION: CGFloat = 18

//state box
let EQUIP_ZPOSITION:CGFloat = 14

// pack box
let GOODS_FRAME_ZPOSITION:CGFloat = 20

/**
 * Speed
 */
let SLOW_RUN_SPEED: CGFloat = 0.5



/**
 * Color
 */
let BOX_LINE_COLOR = UIColor.black
let BOX_LINE_FILL_COLOR = UIColor.white

let BUTTON_LINE_COLOR = UIColor.black
let BUTTON_FILL_COLOR = UIColor.white

let CONTAINER_BOX_LINE_COLOR = UIColor.black
let CONTAINER_BOX_FILL_COLOR = UIColor.white

let FRAME_LINE_COLOR = UIColor.black
let FRAME_FILL_COLOR = UIColor.white

let LIST_ICO_NODE_COLOR = UIColor.gray



/**
 * name
 */
let BUTTON_NAME = "button"
let GOODS_ICO_NAME = "goodsIcoName-"
let PLACE_ICO_NAME = "placeIcoName-"
let SHAPE_NAME = "shape"

// making
let MAKING_TAINER_NAME = "makingTainer"
// map
let MAP_TAINER_NAME = "mapTainer"
// pack
let PACK_TAINER_NAME = "packTainer"
let PACK_GOODS_NAME = "packGoods-"

// font family
let FONT_FAMILY_BOLD_NAME = "Courier-Bold"
let FONT_FAMILY_NAME = "Courier"

// 盒子背景透明度
let BOX_BACK_ALPHA = "4"

// 装备栏名称
//剑
let SWORD_EQUIP_NAME = "swordEquip"
//枪
let GUN_EQUIP_NAME = "gunEquip"

enum attackButtonName: String{
    case attack = "attackButtonName_flag"
    case up = "upButtonName_flag"
    case down = "downButtonName_flag"
    case left = "leftButtonName_flag"
    case right = "rightButtonName_flag"
    case pack1 = "pack1ButtonName_flag"
    case pack2 = "pack2ButtonName_flag"
    case gunSlide = "gunSlideName"
    case gun = "gunButtonName_flag"
}


enum AttackImgName: String{
    case attack = "attackImg"
    case direction = "directionImg"
    case fire = "fireImg"
    case gunSlide = "gunSlideImg"
    case pack = "packImg"
}


/**
 * Button enum
 */
enum buttonIndexEnum: Int {
    case 个人 = 0
    case 图册 = 1
    case 探索 = 2
    case 制造 = 3
    case 商店 = 4
    case 背包 = 5
    case 部落 = 6
    case 掠夺 = 7
}


enum SkillName: String{
    case downBlock = "下格挡"
    case afterTheJump = "后跳"
    case beforeTheJump = "前跳"
}

enum TimeManager: CFTimeInterval{
    case doubleClickTime = 0.5
    case attackSkillBeginTime = 0.6
    case attackSkillEndTime = 0.8
}

