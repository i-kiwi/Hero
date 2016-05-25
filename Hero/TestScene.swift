//
//  Test.swift
//  Hero
//
//  Created by i－Kiwi on 16/4/27.
//  Copyright © 2016年 Kiwi. All rights reserved.
//

import SpriteKit
import JMessage

class TestScene: SKScene{

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
        
        
//        let transform = CGAffineTransformMakeTranslation(0, 0)
//        let path = CGPathCreateMutable()
//        let point0 = CGPointMake(0, 0)
//        let point1 = CGPointMake(150, 0)
//        let point2 = CGPointMake(150, 150)
//        let point3 = CGPointMake(0, 150)
//        let point4 = CGPointMake(0, 0)
//        CGPathAddLines(path, [transform], [point0,point1,point2,point3,point4], 5)
//        
//        let hexagon = SKShapeNode(path: path)
//        hexagon.strokeColor = UIColor.blackColor()
//        hexagon.fillColor = UIColor.whiteColor()
//        hexagon.lineWidth = 5
//
//        
//        self.addChild(hexagon)
//        let myLayer = CALayer()
//        myLayer.frame = CGRect(x: 10, y: 200, width: 100, height: 100)
////        myLayer.backgroundColor = UIColor.redColor().CGColor
//        hexagon.layoutSublayersOfLayer(myLayer)
        
        
//        let messageBox = SKSpriteNode(color: UIColor.lightGrayColor(), size: CGSizeMake(400, 250))
//        messageBox.anchorPoint = CGPointMake(0.5, 40 / 250 + 1)
//        messageBox.position = CGPointMake(0, 0)
//        
//        
//        let transform = CGAffineTransformMakeTranslation(0, -40)
//        let path = CGPathCreateMutable()
//        let point0 = CGPointMake(40, 0
//        let point1 = CGPointMake(0, 40)
//        let point2 = CGPointMake(-40, 0)
//        CGPathAddLines(path, [transform], [point0,point1,point2], 3)
//        let triangle = SKShapeNode(path: path)
//        triangle.strokeColor = UIColor.blackColor()
//        triangle.fillColor = UIColor.whiteColor()
//        triangle.lineWidth = 5
//        
//        messageBox.addChild(triangle)
//        
//        
//        self.addChild(messageBox)
//        
//        messageBox.anchorPoint.x = 0.7
//        messageBox.yScale = -messageBox.yScale
        
        
//        conn()
        
        
    }
    
    // 网路连接
    func conn(){
        let url = NSURL(string: "http://116.58.222.165/CXB_TASK/runner/redis.do?key=person_day_rank&field=1")
        if let data = NSData(contentsOfURL: url!){
            do{
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                let groupName = json.valueForKey("groupName")
                
                print("\(groupName)")
            }catch{
                print("error")
            }
        }
    
//        let request = NSURLRequest(URL: url!)
//        
//        let session = NSURLSession.sharedSession()
//        let task = session.dataTaskWithRequest(request) { (data, response, error) in
//            print("\(response?.textEncodingName)")
//            
////            print("\(data)")
////            print("\(response)")
////            print("\(error)")
////            NSString *aString = [[NSString alloc] initWithData:adata encoding:NSUTF8StringEncoding]
//            let result = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print("\(result)")
//            do{
//                
//                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
//                
//                print("\(json)")
//                
//            }catch{
//                print("error")
//            }
//        }
//        task.resume()
    }
    
}


