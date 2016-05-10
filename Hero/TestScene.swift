//
//  Test.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/27.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit

class TestScene: SKScene {

    override func didMoveToView(view: SKView) {
        
        self.size = SCENE_SIZE
        self.anchorPoint = CGPointMake(0.5, 0.5)
        let vertical = SKShapeNode(rect: CGRectMake(-SCENE_SIZE.width / 2, 0, SCENE_SIZE.width, 1))
        vertical.strokeColor = UIColor.lightGrayColor()
        vertical.lineWidth = 1
        
        let horizontal = SKShapeNode(rect: CGRectMake(0, -SCENE_SIZE.height / 2, 1, SCENE_SIZE.height))
        horizontal.strokeColor = UIColor.lightGrayColor()
        horizontal.lineWidth = 1
        
        self.addChild(vertical)
        self.addChild(horizontal)
        
        
        
        
        
//        let label = SKLabelNode()
//        label.text = "hello world!hello world!hello world!hello world!hello world!"
//        label.fontColor = UIColor.blackColor()
//        label.position = CGPointMake(label.frame.width / 2, 0)
//
//        self.addChild(label)
        
//        //开始图像绘图
//        UIGraphicsBeginImageContext(self.view.bounds.size);
//        //获取当前CGContextRef
//        CGContextRef gc = UIGraphicsGetCurrentContext();
//        
//        //创建用于转移坐标的Transform，这样我们不用按照实际显示做坐标计算
//        CGAffineTransform transform = CGAffineTransformMakeTranslation(50, 50);
//        //创建CGMutablePathRef
//        CGMutablePathRef path = CGPathCreateMutable();
//        //左眼
//        CGPathAddEllipseInRect(path, &transform, CGRectMake(0, 0, 20, 20));
//        //右眼
//        CGPathAddEllipseInRect(path, &transform, CGRectMake(80, 0, 20, 20));
//        //笑
//        CGPathMoveToPoint(path, &transform, 100, 50);
//        CGPathAddArc(path, &transform, 50, 50, 50, 0, M_PI, NO);
//        //将CGMutablePathRef添加到当前Context内
//        CGContextAddPath(gc, path);
//        //设置绘图属性
//        [[UIColor blueColor] setStroke];
//        CGContextSetLineWidth(gc, 2);
//        //执行绘画
//        CGContextStrokePath(gc);
//        
//        //从Context中获取图像，并显示在界面上
//        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        
//        UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
//        [self.view addSubview:imgView];
        
//        UIGraphicsBeginImageContext((self.view?.bounds.size)!)
//        let gc = UIGraphicsGetCurrentContext()
//        
        
        
        let transform = CGAffineTransformMakeTranslation(0, 0)
        let path = CGPathCreateMutable()
        let point0 = CGPointMake(0, 0)
        let point1 = CGPointMake(150, 0)
        let point2 = CGPointMake(150, 150)
        let point3 = CGPointMake(0, 150)
        let point4 = CGPointMake(0, 0)
        CGPathAddLines(path, [transform], [point0,point1,point2,point3,point4], 5)
        
        let hexagon = SKShapeNode(path: path)
        hexagon.strokeColor = UIColor.blackColor()
        hexagon.fillColor = UIColor.whiteColor()
        hexagon.lineWidth = 5
        
        
        self.addChild(hexagon)
        
    }
    
}
