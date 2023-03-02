//
//  KakaoTabbarViewController.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/03.
//

import UIKit

import SnapKit
import Then

class KakaoTabbarController: UITabBarController {
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarUI()
        tabBar.frame.size.height = 61
        tabBar.frame.origin.y = view.frame.height - 61
    }
}

extension KakaoTabbarController {
    
    private func makeTabBar(viewController: UIViewController,
                            tabBarImg: UIImage,
                            tabBarSelectedImg: UIImage,
                            renderingMode: UIImage.RenderingMode) -> UIViewController {
        
        let tab = UINavigationController(rootViewController: viewController)
        tab.isNavigationBarHidden = true
        tab.tabBarItem = UITabBarItem(title: "",
                                      image: tabBarImg.withRenderingMode(renderingMode),
                                      selectedImage: tabBarSelectedImg.withRenderingMode(renderingMode))
        return tab
    }
    
    private func setTabBarUI() {
        let friendTab = makeTabBar(viewController: FriendViewController(),
                                   tabBarImg: Image.friend,
                                   tabBarSelectedImg: Image.selectedFriend,
                                   renderingMode: .alwaysOriginal)
        let chatTab = makeTabBar(viewController: ChattingViewController(),
                                   tabBarImg: Image.chatting,
                                   tabBarSelectedImg: Image.selectedChatting,
                                   renderingMode: .alwaysOriginal)
        let sharpTab = makeTabBar(viewController: SharpViewController(),
                                   tabBarImg: Image.sharp,
                                   tabBarSelectedImg: Image.selectedSharp,
                                   renderingMode: .alwaysOriginal)
        let shopTab = makeTabBar(viewController: ShopViewController(),
                                   tabBarImg: Image.shop,
                                   tabBarSelectedImg: Image.selectedShop,
                                   renderingMode: .alwaysOriginal)
        let settingTab = makeTabBar(viewController: SettingViewController(),
                                   tabBarImg: Image.setting,
                                   tabBarSelectedImg: Image.selectedSetting,
                                   renderingMode: .alwaysOriginal)
        
        let tabs = [friendTab, chatTab, sharpTab, shopTab, settingTab]
        
        self.setViewControllers(tabs, animated: false)
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .black
    }
}
