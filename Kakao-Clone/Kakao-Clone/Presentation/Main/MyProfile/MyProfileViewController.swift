//
//  MyProfileViewController.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/02/13.
//

import UIKit

import SnapKit
import Then

final class MyProfileViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let myProfileImageView = UIImageView()
    private let myProfileNameLabel = UILabel()
    private let myProfileLineView = UIView()
    private let chattingMeView = UIView()
    private let editProfileView = UIView()
    private let kakaoStoryView = UIView()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension MyProfileViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = Color.myProfileback
        
        
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
