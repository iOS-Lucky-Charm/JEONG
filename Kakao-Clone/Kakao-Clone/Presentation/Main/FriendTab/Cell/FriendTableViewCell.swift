//
//  FriendTableViewCell.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/03.
//

import UIKit

import SnapKit
import Then

final class FriendTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let friendListProfile: UIImageView = UIImageView()
    private let friendListName: UILabel = UILabel()
    private let friendListStatusMessage: UILabel = UILabel()
    
    // MARK: - Properties
    
    let myFirestore = MyFirestore()
    
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
        
        friendListName.do {
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
            $0.textColor = .black
        }
        
        friendListStatusMessage.do {
            $0.font = .systemFont(ofSize: 11, weight: .regular)
            $0.textColor = .systemGray
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        contentView.addSubviews(friendListProfile, friendListName, friendListStatusMessage)
        
        friendListProfile.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(44)
            $0.height.equalTo(41)
        }
        
        friendListName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(9)
            $0.leading.equalTo(friendListProfile.snp.trailing).offset(11)
        }
        
        friendListStatusMessage.snp.makeConstraints {
            $0.top.equalTo(friendListName.snp.bottom).offset(3)
            $0.leading.equalTo(friendListName)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: FriendListModel) {
        let url = URL(string: model.friendProfile)
        var image: UIImage
        friendListProfile.image = UIImage.load(url: url!)
        friendListName.text = model.friendName
        friendListStatusMessage.text = model.friendStatusMessage
    }
    
    func friendListSubscribe() {
        myFirestore.subscribe(id: "123") { [weak self] result in
            switch result {
            case .success(let friensLists)
                self?.setDataBind(model: $0.convertToFriendList())
            }
        }
    }
}

