//
//  ChattingViewController.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/03.
//

import UIKit

import SnapKit
import Then

final class ChattingViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let chattingLabel: UILabel = UILabel()
    private let openChattingLabel: UILabel = UILabel()
    private let plusIconImage: UIImageView = UIImageView()
    private let settingIconImage: UIImageView = UIImageView()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension ChattingViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        chattingLabel.do {
            $0.text = "채팅"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 22, weight: .medium)
        }
        
        openChattingLabel.do {
            $0.text = "오픈채팅"
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 22, weight: .medium)
        }
        
        plusIconImage.do {
            $0.image = Image.plusIcon
        }
        
        settingIconImage.do {
            $0.image = Image.settingIcon
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(chattingLabel, openChattingLabel, plusIconImage, settingIconImage)
        
        chattingLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(14)
        }
        
        openChattingLabel.snp.makeConstraints {
            $0.top.equalTo(chattingLabel)
            $0.leading.equalTo(chattingLabel.snp.trailing).offset(7)
        }
        
        settingIconImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(17)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.width.height.equalTo(19)
        }
        
        plusIconImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(17)
            $0.trailing.equalTo(settingIconImage.snp.leading).inset(-12)
            $0.width.height.equalTo(19)
        }
    }
    
    // MARK: - Methods
    
    // MARK: - @objc Methods
}
