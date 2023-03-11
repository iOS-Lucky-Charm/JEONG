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
    private let albumCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    private var albumModel: [AlbumModel] = AlbumModel.albumModelDummyData()
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
        setAddTarget()
    }
}

extension AlbumViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = .white
        
        dismissButton.do {
            $0.setImage(Image.closeIcon, for: .normal)
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
        
        albumCollectionView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = true
            $0.backgroundColor = .clear
            $0.isScrollEnabled = true
            $0.registerCell(AlbumCollectionViewCell.self)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(dismissButton, recentItemLabel, sendButton, albumCollectionView)
        
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
        
        albumCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(38)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        albumCollectionView.delegate = self
        albumCollectionView.dataSource = self
    }
    
    private func setAddTarget() {
        dismissButton.addTarget(self, action: #selector(dismissButtonDidTap), for: .touchUpInside)
    }
    
    private func dismissToChatVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - @objc Methods
    
    @objc private func dismissButtonDidTap() {
        dismissToChatVC()
    }
}

// MARK: - UICollectionViewDataSource

extension AlbumViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: AlbumCollectionViewCell.self, indexPath: indexPath)
        cell.setDataBind(model: albumModel[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AlbumViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 18
        return CGSize(width: width / 3, height: 119)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
}
