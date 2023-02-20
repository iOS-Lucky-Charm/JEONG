//
//  ProfileButton.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/02/20.
//

import UIKit

final class ProfileButton: UIButton {
    
    // MARK: - Property
    
    var buttonName: AttributedString
    var buttonImage: UIImage
    
    // MARK: - Initializer
    
    init(buttonName: AttributedString, buttonImage: UIImage) {
        self.buttonName = buttonName
        self.buttonImage = buttonImage
        super.init(frame: .zero)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Components Property
    
    func setUI() {
        
        buttonName.font = .systemFont(ofSize: 10, weight: .regular)
        
        var config = UIButton.Configuration.filled()
        config.attributedTitle = buttonName
        config.titleAlignment = .center
        config.image = buttonImage
        config.imagePadding = 9
        config.baseBackgroundColor = Color.myProfileback
        config.imagePlacement = NSDirectionalRectEdge.top
        configuration = config
    }
}
