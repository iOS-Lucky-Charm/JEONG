//
//  UITabBar.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/09.
//

import UIKit

extension UITabBar {
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        
    var sizeThatFits = super.sizeThatFits(size)
    sizeThatFits.height = 61
    return sizeThatFits
    }
}
