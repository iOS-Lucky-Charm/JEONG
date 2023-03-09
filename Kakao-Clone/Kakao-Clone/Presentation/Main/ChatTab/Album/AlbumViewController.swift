//
//  AlbumViewController.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/09.
//

import UIKit

import SnapKit
import Then

final class AlbumViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let dismissButton: UIButton = UIButton()
    private let recentItemLabel: UILabel = UILabel()
    private let sendButton: UIButton = UIButton()
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension AlbumViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = .white
        
        dismissButton.do {
            $0.setImage(Image.closeIcon, for: .normal)
            $0.addTarget(self, action: #selector(dismissButtonDidTap), for: .touchUpInside)
        }
        
        recentItemLabel.do {
            $0.text = "최근 항목"
            $0.font = .systemFont(ofSize: 16, weight: .regular)
            $0.textColor = .black
            $0.textAlignment = .center
        }
        
        sendButton.do {
            $0.setTitle("전송", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(dismissButton, recentItemLabel, sendButton)
        
        dismissButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(7)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(12)
        }
        
        recentItemLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(11)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        sendButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(11)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(16)
        }
    }
    
    // MARK: - Methods
    
    private func dismissToChatVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - @objc Methods
    
    @objc private func dismissButtonDidTap() {
        dismissToChatVC()
    }
}
