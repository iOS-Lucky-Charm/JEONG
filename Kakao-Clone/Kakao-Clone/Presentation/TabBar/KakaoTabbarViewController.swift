//
//  KakaoTabbarViewController.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/03.
//

import UIKit

import SnapKit
import Then

class KakaoTabbarViewController: UIViewController {
    
    // MARK: - Properties
    
    private var tabs: [UIViewController] = []
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarItems()
        setTabBarUI()
    }
}

extension KakaoTabbarViewController {
    
    private func setTabBarItems() {
        tabs = [
            FriendViewController(),
            ChattingViewController(),
            SharpViewController(),
            ShopViewController(),
            SettingViewController()
        ]
    }
    
    private func setTabBarUI() {

    }
}
