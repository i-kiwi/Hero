//
//  MathUtil.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/28.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class MathUtil: NSObject {

    class func isInRange(num: CGFloat?, range: (CGFloat, CGFloat)) -> Bool{
        if num > range.0 && num < range.1 {
            return true
        }
        return false
    }
}
