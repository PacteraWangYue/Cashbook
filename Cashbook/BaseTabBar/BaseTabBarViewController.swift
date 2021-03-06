//
//  JJBaseTabBarViewController.swift
//  moneyBoom
//
//  Created by Pactera on 2019/1/3.
//  Copyright © 2019 16. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController, BaseTabBarDelegate{
    
    var tarbarConfigArr:[Dictionary<String,String>]! //标签栏配置数组，从Plist文件中读取
    var mainTabBarView: BaseTabBarView! //自定义的底部TabbarView
    
    //MARK: - Life Cycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        //1.调用父类的初始化方法
        super.init(nibName: nil, bundle: nil)
        //2.读取Plist文件,初始化标签栏配置数组
        self.tarbarConfigArr = self.getConfigArrFromPlistFile()
        //3.创建视图控制器
        self.createControllers()
        //4.创建自定义TabBarView
        self.createMainTabBarView()
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
    }
    
    //MARK: - Private Methods
    private  func  getConfigArrFromPlistFile() ->([Dictionary<String,String>]?){
        let  filePath: String? = Bundle.main.path(forResource: "BaseTabBarConfig", ofType: "plist")
        let plistData = NSDictionary(contentsOfFile: filePath ?? "")
        let configArr = plistData?.object(forKey: "Tabbars") as? [Dictionary<String,String>]
        return configArr;
    }
    
    //创建视图控制器
    private func createControllers(){
        
        var controllerNameArray = [String]() //控制器类名数组
        var controllerTitle = [String]()     //控制器Title数组
        for dictionary in self.tarbarConfigArr{
            controllerNameArray.append(dictionary["ClassName"]!);
            controllerTitle.append(dictionary["Title"]!)
            
            guard controllerNameArray.count > 0 else{
                print("error:控制器数组为空")
                return
            }
            // 初始化导航控制器数组
            var nvcArray = [BaseNavigationViewController]()
            // 在Swift中, 通过字符串创建一个类, 那么必须加上命名空间clsName
            let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
            for i in 0...controllerNameArray.count-1 {
                // 动态获取的命名空间是不包含.的, 所以需要我们自己手动拼接
                let anyClass: AnyClass? = NSClassFromString(clsName + "." + controllerNameArray[i])
                // 将AnyClass类型转换为UIViewController类型，
                // 因为Swift中通过一个Class来创建一个对象, 必须告诉系统这个Class的确切类型
                if let vcClassType = anyClass as? UIViewController.Type {
                    let viewcontroller = vcClassType.init()
                    viewcontroller.title = controllerTitle[i]
                    let nav = BaseNavigationViewController(rootViewController:viewcontroller)
                    nvcArray.append(nav)
                }
            }
            //设置标签栏控制器数组
            self.viewControllers = nvcArray
        }
    }
    
    
    //创建自定义Tabbar
    private func createMainTabBarView(){
        //1.获取系统自带的标签栏视图的frame,并将其设置为隐藏
        let tabBarRect = self.tabBar.frame;
        self.tabBar.isHidden = true;
        //3.使用得到的frame，和plist数据创建自定义标签栏
        mainTabBarView = BaseTabBarView(frame: tabBarRect,tabbarConfigArr:tarbarConfigArr!);
        mainTabBarView.delegate = self
        self.view .addSubview(mainTabBarView)
    }
    
    //MARK: - BaseTabBarDelegate
    func didChooseItem(itemIndex: Int) {
        self.selectedIndex = itemIndex
    }
}
