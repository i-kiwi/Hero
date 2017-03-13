//
//  MathUtil.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/28.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class MathUtil: NSObject {

    class func isInRange(_ num: CGFloat?, range: (CGFloat, CGFloat)) -> Bool{
        if num > range.0 && num < range.1 {
            return true
        }
        return false
    }
}
