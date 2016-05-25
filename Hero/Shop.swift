//
//  Shop.swift
//  Hero
//
//  Created by i－Kiwi on 16/5/23.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class Shop {

    
    var shopBox:SKSpriteNode!
    var shopTopFrame:SKSpriteNode!
    var shopBtmFrame:SKSpriteNode!
    
    // box factory
    let boxFactory = BoxFactory.getInstance()
    
    let single: String!
    static var instance: Shop!
    class func getInstance() -> Shop {
        if let shop = self.instance{
            return shop
        }else{
            self.instance = Shop()
            return self.instance
        }
    }
    
    init(){
        self.single = "the single mode"
        
        self.shopBox = boxFactory.getModuleContainerBox()
        
        
    }
    
    
}
