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
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        addSubviews(albumImageView)
        
        albumImageView.snp.makeConstraints {
            $0.width.height.equalTo(119)
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: AlbumModel) {
        albumImageView.image = model.albumImage
    }
}
