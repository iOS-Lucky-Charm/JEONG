//
//  TabBarItem.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/03.
//

import UIKit

enum TabBarItemType: Int, CaseIterable {
    case friend
    case chatting
    case sharp
    case shop
    case setting
}

extension TabBarItemType {
    
    var selectedIcon: UIImage {
        switch self {
        case .friend:
            return Image.selectedFriend
        case .chatting:
            return Image.selectedChatting
        case .sharp:
            return Image.selectedSharp
        case .shop:
            return Image.selectedShop
        case .setting:
            return Image.selectedSetting
        }
    }
    
    var unSelectedIcon: UIImage {
        switch self {
        case .friend:
            return Image.friend
        case .chatting:
            return Image.chatting
        case .sharp:
            return Image.sharp
        case .shop:
            return Image.shop
        case .setting:
            return Image.setting
        }
    }
    
    public func setTabBarItem() -> UITabBarItem {
        return UITabBarItem (
            title: "",
            image: unSelectedIcon,
            selectedImage: selectedIcon
        )
    }
}
