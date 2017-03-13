//
//  TouchUtil.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/27.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class TouchUtil {

    var target: AnyObject?
    var action: Selector?
    
    init(target: AnyObject?, action: Selector){
        self.target = target
        self.action = action
        
        
        // Demo
        //        let touches = touches as NSSet
        //        let touch: AnyObject? = touches.anyObject()
        //        if let _ = touch {
        //            if touch!.tapCount == 2{
        //                NSLog("double click")
        //            }
        //        }
        
        
        // Demo
        //left move
//        let swi = UISwipeGestureRecognizer(target: self, action: Selector(self.left()))
//        swi.direction = UISwipeGestureRecognizerDirection.left
//        self.view?.addGestureRecognizer(swi)
        
        // cilck
//        let tap = UITapGestureRecognizer(target: self, action: Selector(self.tap()))
//        self.view?.addGestureRecognizer(tap)
        
        // long press
//        let longpress = UILongPressGestureRecognizer(target: self, action: Selector(self.longPress()))
//        longpress.minimumPressDuration = 3
//        self.view?.addGestureRecognizer(longpress)
    }
    
    
    
    func left(){
        NSLog("left")
    }
    
    func tap(){
        NSLog("tap")
    }
    
    func longPress(){
        NSLog("long press")
    }
    
    
}
