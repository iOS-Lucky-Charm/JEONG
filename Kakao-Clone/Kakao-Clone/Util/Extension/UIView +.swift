//
//  UIView +.swift
//  MarketKurly-Clone
//
//  Created by KJ on 2023/03/21.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
