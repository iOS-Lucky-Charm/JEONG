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
    
    // MARK: - Properties
    
    private var selectedImageList = [Int]()
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setUI()
        setLayout()
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
//        cell.albumImageView.image = albumImage[indexPath.item]
//        cell.layer.borderWidth = 0
//        cell.selectedView.isHidden = true
//        if !selectedNumberArray.isEmpty {
//            print("cellForitemAt")
//            for i in 0...selectedNumberArray.count - 1 {
//                if indexPath.item == selectedNumberArray[i] {
//                    cell.layer.borderColor = UIColor.systemYellow.cgColor
//                    cell.layer.borderWidth = 3
//                    cell.selectedView.isHidden = false
//                    cell.selectedLabel.text = "\(i)"
//                }
//            }
//        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! AlbumCollectionViewCell
        
//        if cell.selectedView.isHidden == true {
//            if selectedNumberArray.count < 10 {
//                selectedNumberArray.append(indexPath.item)
//                print(selectedNumberArray)
//                for i in 0...selectedNumberArray.count - 1 {
//                    if indexPath.item == selectedNumberArray[i] {
//                        cell.layer.borderColor = UIColor.systemYellow.cgColor
//                        cell.layer.borderWidth = 3
//                        cell.selectedView.isHidden = false
//                        cell.selectedLabel.text = "\(i)"
//                    }
//                }
//            }
//        }
//        else if cell.selectedView.isHidden == false {
//            selectedNumberArray.remove(at: Int(cell.selectedLabel.text!)!)
//            print(selectedNumberArray)
//            cell.layer.borderWidth = 0
//            cell.selectedView.isHidden = true
//        }
        if selectedImageList.contains(indexPath.row) {
            guard let index = selectedImageList.firstIndex(of: indexPath.row) else { return }
            selectedImageList.remove(at: index)
            cell.unSelectedBorder()
            selectedImageList.forEach {
                let selectedCell = collectionView.cellForItem(at: [0, $0]) as! AlbumCollectionViewCell
                guard let newIndex = selectedImageList.firstIndex(of: $0) else { return }
                selectedCell.changeIndexLabel(index: newIndex)
            }
        }
        else {
            selectedImageList.append(indexPath.row)
            guard let index = selectedImageList.firstIndex(of: indexPath.row) else { return }
            cell.selectedBorder(index: index)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AlbumViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 18) / 3
        let height = width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
}
