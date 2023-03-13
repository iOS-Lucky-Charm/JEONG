//
//  AlbumCollectionViewCell.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/10.
//

import UIKit

import SnapKit
import Then

final class AlbumCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let albumImageView: UIImageView = UIImageView()
    let selectNumberLabel: UILabel = UILabel()
    
    // MARK: - Properties
    
    var selectPhoto = [UIImage]()
    var selectPhotoArray = [Int]()
    var number = Int()
    
    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlbumCollectionViewCell {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        selectNumberLabel.do {
            $0.backgroundColor = .systemYellow
            $0.layer.cornerRadius = 10
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(albumImageView, selectNumberLabel)
        
        albumImageView.snp.makeConstraints {
            $0.width.height.equalTo(119)
        }
        
        selectNumberLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.trailing.equalToSuperview().inset(4)
            $0.width.height.equalTo(18)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: AlbumModel) {
        albumImageView.image = model.albumImage
    }
}
