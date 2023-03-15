//
//  AlbumCollectionViewCell.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/10.
//

import UIKit

import SnapKit
import Then

class AlbumCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    let albumImageView: UIImageView = UIImageView()
    let selectedView: UIView = UIView()
    let selectedLabel: UILabel = UILabel()
    
    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
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
        
        selectedView.do {
            $0.layer.cornerRadius = 9
            $0.backgroundColor = .systemYellow
            $0.isHidden = true
        }
        
        selectedLabel.do {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 10, weight: .regular)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        contentView.addSubviews(albumImageView, selectedView)
        selectedView.addSubviews(selectedLabel)
        
        albumImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        selectedView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(4)
            $0.width.height.equalTo(18)
        }
        
        selectedLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func setDataBind(model: AlbumModel) {
        albumImageView.image = model.albumImage
    }
    
    func selectedBorder(index: Int) {
        albumImageView.layer.borderWidth = 3
        albumImageView.layer.borderColor = UIColor.systemYellow.cgColor
        selectedView.isHidden = false
        selectedLabel.text = String(index + 1)
    }
    
    func unSelectedBorder() {
        albumImageView.layer.borderWidth = 0
        albumImageView.layer.borderColor = .none
        selectedView.isHidden = true
    }
    
    func changeIndexLabel(index: Int) {
        selectedLabel.text = String(index + 1)
    }
}
