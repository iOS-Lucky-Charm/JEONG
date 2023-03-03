//
//  FriendTableViewCell.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/03.
//

import UIKit

import SnapKit
import Then

class FriendTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let friendListProfile: UIImageView = UIImageView()
    private let friendListName: UILabel = UILabel()
    private let friendListStatusMessage: UILabel = UILabel()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FriendTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = .white
        contentView.backgroundColor = .clear
        contentView.addSubviews(friendListProfile, friendListName, friendListStatusMessage)
        
        friendListName.do {
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
            $0.textColor = .black
        }
        
        friendListStatusMessage.do {
            $0.font = .systemFont(ofSize: 11, weight: .regular)
            $0.textColor = .systemGray4
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        friendListProfile.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(44)
        }
        
        friendListName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(9)
            $0.leading.equalTo(friendListProfile).offset(11)
        }
        
        friendListStatusMessage.snp.makeConstraints {
            $0.top.equalTo(friendListName).offset(3)
            $0.leading.equalTo(friendListName)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: FriendListModel) {
        friendListProfile.image = model.friendProfile
        friendListName.text = model.friendName
        friendListStatusMessage.text = model.friendStatusMessage
    }
}

