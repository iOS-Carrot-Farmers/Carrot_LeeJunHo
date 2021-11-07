//
//  TabBarController.swift
//  CarrotMarket_CloneCoding
//
//  Created by Junho Lee on 2021/11/07.
//

import UIKit

class TabBarController: UITabBarController {
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    //MARK: - Basic Setup
    
    func setTabBar() {
        let homeSB = UIStoryboard.init(name: "HomeSB", bundle:nil)
        let homeNVC = homeSB.instantiateViewController(identifier: "HomeNVC")
        
        let townSB = UIStoryboard.init(name: "TownSB", bundle:nil)
        let townNVC = townSB.instantiateViewController(identifier: "TownNVC")
        
        let myAroundSB = UIStoryboard.init(name: "MyAroundSB", bundle:nil)
        let myAroundNVC = myAroundSB.instantiateViewController(identifier: "MyAroundNVC")
        
        let chatSB = UIStoryboard.init(name: "ChatSB", bundle:nil)
        let chatNVC = chatSB.instantiateViewController(identifier: "ChatNVC")
        
        let myCarrotSB = UIStoryboard.init(name: "MyCarrotSB", bundle:nil)
        let myCarrotNVC = myCarrotSB.instantiateViewController(identifier: "MyCarrotNVC")
        
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
      
        //MARK: - tabBarItem data
        
        homeNVC.tabBarItem = UITabBarItem(title : "홈", image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIconFill"))
        townNVC.tabBarItem = UITabBarItem(title : "동네생활", image: UIImage(named: "townIcon"), selectedImage: UIImage(named: "townIconFill"))
        myAroundNVC.tabBarItem = UITabBarItem(title : "내 근처", image: UIImage(named: "myAroundIcon"), selectedImage: UIImage(named: "myAroundIconFill"))
        chatNVC.tabBarItem = UITabBarItem(title : "채팅", image: UIImage(named: "chatIcon"), selectedImage: UIImage(named: "chatIconFill"))
        myCarrotNVC.tabBarItem = UITabBarItem(title : "나의 당근", image: UIImage(named: "myCarrotIcon"), selectedImage: UIImage(named: "myCarrotIconFill"))
        
        setViewControllers([homeNVC, townNVC, myAroundNVC, chatNVC, myCarrotNVC], animated: true)
    }
}
