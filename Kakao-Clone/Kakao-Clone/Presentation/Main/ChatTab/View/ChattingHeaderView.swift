//
//  ChattingHeaderView.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/04.
//

import UIKit

import SnapKit
import Then

class ChattingHeaderView: UITableViewHeaderFooterView {

    static let identifier = "ChattingHeaderView"
    
    // MARK: - UI Components
    
    private let chattingAdvertisement: UIImageView = UIImageView()
    
    // MARK: - Initializer
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChattingHeaderView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        backgroundColor = .white
        
        chattingAdvertisement.do {
            $0.image = Image.advertisement
            $0.layer.cornerRadius = 6
            $0.clipsToBounds = true
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(chattingAdvertisement)
        
        chattingAdvertisement.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(71)
            $0.bottom.equalToSuperview().inset(8)
        }
    }
}
