//
//  FriendViewHeaderFooterView.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/03.
//

import UIKit

import SnapKit
import Then

class FriendViewHeaderFooterView: UITableViewHeaderFooterView {
    
    static let identifier = "FriendViewHeaderFooterView"

    // MARK: - UI Components
    
    private let myProfileImageButton: UIButton = UIButton()
    private let myProfileName: UILabel = UILabel()
    private let myProfileStatusMessage: UILabel = UILabel()
    
    // MARK: - Properties
    
    var userName: String?
    
    // MARK: - Initializer

    override init( reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FriendViewHeaderFooterView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        backgroundColor = .white
        
        myProfileImageButton.do {
            $0.setImage(Image.profileImage, for: .normal)
            $0.addTarget(self, action: #selector(myProfileDidTap), for: .touchUpInside)
        }
        
        myProfileName.do {
            $0.text = "권정"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 22, weight: .semibold)
        }
        
        myProfileStatusMessage.do {
            $0.text = "언제다하냐"
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 11, weight: .regular)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(myProfileImageButton, myProfileName, myProfileStatusMessage)
        
        myProfileImageButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(59)
        }
        
        myProfileName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(myProfileImageButton.snp.trailing).offset(11)
        }
        
        myProfileStatusMessage.snp.makeConstraints {
            $0.top.equalTo(myProfileName.snp.bottom).offset(6)
            $0.leading.equalTo(myProfileName)
        }
    }
    
    // MARK: - Methods
    
    private func presentToMyProfileVC() {
        let myProfileVC = MyProfileViewController()
        myProfileVC.userName = userName
        myProfileVC.setDataBind()
        myProfileVC.modalPresentationStyle = .fullScreen
        self.present(myProfileVC, animated: true, completion: nil)
    }
    
    // MARK: - @objc Methods

    @objc private func myProfileDidTap() {
        presentToMyProfileVC()
    }
}
