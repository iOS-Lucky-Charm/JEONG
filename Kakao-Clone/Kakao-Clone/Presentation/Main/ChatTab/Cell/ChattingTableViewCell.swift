//
//  ChattingTableViewCell.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/04.
//

import UIKit

import SnapKit
import Then

class ChattingTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let chattingProfile: UIImageView = UIImageView()
    private let chattingName: UILabel = UILabel()
    private let chattingPreview: UILabel = UILabel()
    private let chattingTime: UILabel = UILabel()
    
    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChattingTableViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        backgroundColor = .white
        contentView.backgroundColor = .clear
    
        chattingName.do {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 12, weight: .semibold)
        }
        
        chattingPreview.do {
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 11, weight: .regular)
        }
        
        chattingTime.do {
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 8, weight: .regular)
        }
    }
    
    private func setLayout() {
        contentView.addSubviews(chattingProfile, chattingName, chattingPreview, chattingTime)
        
        chattingProfile.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        
        chattingName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(chattingProfile.snp.trailing).offset(11)
        }
        
        chattingPreview.snp.makeConstraints {
            $0.top.equalTo(chattingName.snp.bottom).offset(3)
            $0.leading.equalTo(chattingName)
        }
        
        chattingTime.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: ChattingModel) {
        chattingProfile.image = model.friendProfile
        chattingName.text = model.friendName
        chattingPreview.text = model.friendChatPreview
        chattingTime.text = model.friendChatTime
    }
}
