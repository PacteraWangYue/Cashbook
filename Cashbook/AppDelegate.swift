//
//  AppDelegate.swift
//  Cashbook
//
//  Created by 王越 on 2018/12/28.
//  Copyright © 2018 王越. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

//test
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        //设置Window的根视图控制器为自定义的标签栏
//        let mainTabBarVC = ViewController();
        let mainTabBarVC = MenuViewController()
        self.window?.rootViewController = mainTabBarVC;
        if UserDefaults.standard.dictionary(forKey: "expend") == nil{
            let expendDic:Dictionary<String,Any> =
                [ "title":"支出",
                  "array":
                    [
                        ["title":"食物", "color":UIColor.randomColor.htmlRGBColor,"comment":"备注：快餐，饮料"],
                        ["title":"衣物", "color":UIColor.randomColor.htmlRGBColor,"comment":"备注：衣服，鞋子，饰品"],
                        ["title":"社交", "color":UIColor.randomColor.htmlRGBColor,"comment":"备注：聚餐，礼物"],
                        ["title":"娱乐", "color":UIColor.randomColor.htmlRGBColor,"comment":"备注：旅游，电影"],
                        ["title":"医疗", "color":UIColor.randomColor.htmlRGBColor,"comment":"备注：药品，保健品"],
                        ["title":"交通", "color":UIColor.randomColor.htmlRGBColor,"comment":"备注：邮费，公交费"],
                        ["title":"住房", "color":UIColor.randomColor.htmlRGBColor,"comment":"备注：房租，水电"],
                        ["title":"教育", "color":UIColor.randomColor.htmlRGBColor,"comment":"备注：书籍，学费，在线教育"]
                    ]
                ]
            UserDefaults.standard.set(expendDic, forKey: "expend")
        }
    
        if UserDefaults.standard.dictionary(forKey: "income") == nil{
            let incomeDic:Dictionary<String,Any> =
                [ "title":"收入",
                  "array":
                    [
                        ["title":"工资", "color":UIColor.randomColor.htmlRGBColor,"comment":"备注：工资"],
                        ["title":"奖金", "color":UIColor.randomColor.htmlRGBColor,"comment":"备注：奖金"],
                        ["title":"投资", "color":UIColor.randomColor.htmlRGBColor,"comment":"备注：股票l，理财"]
                    ]
            ]
            UserDefaults.standard.set(incomeDic, forKey: "income")
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension UIColor {
    class func color(withData data:Data) -> UIColor {
        return NSKeyedUnarchiver.unarchiveObject(with: data) as! UIColor
    }
    
    func encode() -> Data {
        return NSKeyedArchiver.archivedData(withRootObject: self)
    }
}
