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
    
    private let albumImageView: UIImageView = UIImageView()
    private let selectedView: UIView = UIView()
    private let selectedLabel: UILabel = UILabel()
    
    // MARK: - Properties
    
//    var selectedCell: Bool = true
    
    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                selectedView.isHidden = false
            }
            else {
                selectedView.isHidden = true
            }
        }
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
}
