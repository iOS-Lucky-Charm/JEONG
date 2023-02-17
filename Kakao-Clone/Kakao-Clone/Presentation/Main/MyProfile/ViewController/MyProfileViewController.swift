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
    private let chattingMeView = UIView()
    private let editProfileView = UIView()
    private let kakaoStoryView = UIView()
    
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
            $0.text = "권정"
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 18, weight: .regular)
            $0.textColor = .white
        }
        
        myProfileLineView.do {
            $0.backgroundColor = Color.myProfileLine
        }
        
        chattingMeView.do {
            $0.backgroundColor = .red
        }
        
        editProfileView.do {
            $0.backgroundColor = .black
        }
        
        kakaoStoryView.do {
            $0.backgroundColor = .gray
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(myProfileImageView, myProfileNameLabel, myProfileLineView,
                         chattingMeView, editProfileView, kakaoStoryView, myProfileCloseButton)
        
        myProfileCloseButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(14)
            $0.leading.equalToSuperview().offset(18)
            $0.width.height.equalTo(14)
        }
        
        editProfileView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(48)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(92)
            $0.height.equalTo(72)
        }
        
        chattingMeView.snp.makeConstraints {
            $0.bottom.equalTo(editProfileView)
            $0.trailing.equalTo(editProfileView.snp.leading)
            $0.width.equalTo(92)
            $0.height.equalTo(72)
        }
        
        kakaoStoryView.snp.makeConstraints {
            $0.bottom.equalTo(editProfileView)
            $0.leading.equalTo(editProfileView.snp.trailing)
            $0.width.equalTo(92)
            $0.height.equalTo(72)
        }
        
        myProfileLineView.snp.makeConstraints {
            $0.bottom.equalTo(editProfileView.snp.top).offset(-11)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(1)
        }
        
        myProfileNameLabel.snp.makeConstraints {
            $0.bottom.equalTo(myProfileLineView.snp.top).offset(-42)
            $0.centerX.equalToSuperview()
        }
        
        myProfileImageView.snp.makeConstraints {
            $0.bottom.equalTo(myProfileNameLabel.snp.top).offset(-8)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(97)
            $0.height.equalTo(96)
        }
    }
    
    // MARK: - Methods
    
    private func dismissToFriendVC() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - @objc Methods
    
    @objc private func dismissCloseButtonDidTap() {
        dismissToFriendVC()
    }
}
