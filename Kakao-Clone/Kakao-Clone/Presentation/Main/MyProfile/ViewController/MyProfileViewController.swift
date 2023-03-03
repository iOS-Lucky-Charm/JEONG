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
    
    private let myProfileCloseButton = UIButton()
    private let myProfileImageView = UIImageView()
    private let myProfileNameLabel = UILabel()
    private let myProfileLineView = UIView()
    
    private let chattingMeButton = ProfileButton(buttonName: "나와의 채팅", buttonImage: Image.profileTalk)
    private let editProfileButton = ProfileButton(buttonName: "프로필 편집", buttonImage: Image.profileEditing)
    private let kakaoStoryButton = ProfileButton(buttonName: "카카오스토리", buttonImage: Image.profileStory)
    
    // MARK: - Properties
    
    var userName: String?
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
      navigationController?.isNavigationBarHidden = true
    }
    
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
        
        myProfileCloseButton.do {
            $0.setImage(Image.profileClose, for: .normal)
            $0.addTarget(self, action: #selector(dismissCloseButtonDidTap), for: .touchUpInside)
        }
        
        myProfileImageView.do {
            $0.image = Image.profileImage
        }
        
        myProfileNameLabel.do {
            $0.text = userName
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 18, weight: .regular)
            $0.textColor = .white
            $0.numberOfLines = 2
        }
        
        myProfileLineView.do {
            $0.backgroundColor = Color.myProfileLine
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(myProfileCloseButton, myProfileImageView, myProfileNameLabel,
                         myProfileLineView, chattingMeButton, editProfileButton, kakaoStoryButton)
        
        myProfileCloseButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(14)
            $0.leading.equalToSuperview().offset(18)
            $0.width.height.equalTo(14)
        }
        
        editProfileButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(48)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(92)
            $0.height.equalTo(72)
        }
        
        chattingMeButton.snp.makeConstraints {
            $0.bottom.equalTo(editProfileButton)
            $0.trailing.equalTo(editProfileButton.snp.leading)
            $0.width.equalTo(92)
            $0.height.equalTo(72)
        }
        
        kakaoStoryButton.snp.makeConstraints {
            $0.bottom.equalTo(editProfileButton)
            $0.leading.equalTo(editProfileButton.snp.trailing)
            $0.width.equalTo(92)
            $0.height.equalTo(72)
        }
        
        myProfileLineView.snp.makeConstraints {
            $0.bottom.equalTo(editProfileButton.snp.top).inset(-11)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(1)
        }
        
        myProfileNameLabel.snp.makeConstraints {
            $0.bottom.equalTo(myProfileLineView.snp.top).inset(-42)
            $0.centerX.equalToSuperview()
        }
        
        myProfileImageView.snp.makeConstraints {
            $0.bottom.equalTo(myProfileNameLabel.snp.top).inset(-8)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(97)
            $0.height.equalTo(96)
        }
    }
    
    // MARK: - Methods
    
    private func dismissToFriendVC() {
        dismiss(animated: true, completion: nil)
    }
    
    func setDataBind() {
        guard let userName = self.userName else { return }
        myProfileNameLabel.text = userName
        print(userName)
    }
    
    // MARK: - @objc Methods
    
    @objc private func dismissCloseButtonDidTap() {
        dismissToFriendVC()
    }
}
