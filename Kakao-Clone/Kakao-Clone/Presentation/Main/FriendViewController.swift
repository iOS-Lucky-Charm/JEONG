//
//  FriendViewController.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/02/13.
//

import UIKit

import SnapKit
import Then

final class FriendViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let friendLabel = UILabel()
    private let settingImageView = UIImageView()
    private let myProfileImageButton = UIButton()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
      navigationController?.isNavigationBarHidden = true // 뷰 컨트롤러가 나타날 때 숨기기
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension FriendViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        friendLabel.do {
            $0.text = "친구"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 22, weight: .semibold)
        }
        
        settingImageView.do {
            $0.image = Image.settingIcon
        }
        
        myProfileImageButton.do {
            $0.setImage(Image.profileImage, for: .normal)
            $0.addTarget(self, action: #selector(myProfileDidTap), for: .touchUpInside)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(friendLabel, settingImageView, myProfileImageButton)
        
        friendLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(14)
        }
        
        settingImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(14)
            $0.leading.equalTo(friendLabel.snp.trailing).offset(4)
            $0.width.height.equalTo(21)
        }
        
        myProfileImageButton.snp.makeConstraints {
            $0.top.equalTo(friendLabel.snp.bottom).offset(26)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(14)
            $0.width.equalTo(59)
            $0.height.equalTo(58)
        }
    }
    
    // MARK: - Methods
    
    private func presentToMyProfileVC() {
        let myProfileVC = MyProfileViewController()
        myProfileVC.modalPresentationStyle = .fullScreen
//        myProfileVC.userName = userNameValue()
        myProfileVC.setDataBind()
        self.present(myProfileVC, animated: true, completion: nil)
    }
    
    // MARK: - @objc Methods

    @objc private func myProfileDidTap() {
        presentToMyProfileVC()
    }
}
