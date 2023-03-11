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
    private let plusIconButton: UIButton = UIButton()
    private let settingIconButton: UIButton = UIButton()
    private let chattingAdvertisement: UITableView = UITableView()
    private let chattingTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    private var chattingModel: [ChattingModel] = ChattingModel.chattingModelDummyData()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
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
        
        plusIconButton.do {
            $0.setImage(Image.plusIcon, for: .normal)
            $0.addTarget(self, action: #selector(plusIconButtonDidTap), for: .touchUpInside)
        }
        
        settingIconButton.do {
            $0.setImage(Image.settingIcon, for: .normal)
        }
        
        chattingTableView.do {
            $0.backgroundColor = .white
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
            $0.registerCell(ChattingTableViewCell.self)
            $0.register(ChattingHeaderView.self, forHeaderFooterViewReuseIdentifier: ChattingHeaderView.identifier)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(chattingLabel, openChattingLabel, plusIconButton, settingIconButton, chattingTableView)
        
        chattingLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(14)
        }
        
        openChattingLabel.snp.makeConstraints {
            $0.top.equalTo(chattingLabel)
            $0.leading.equalTo(chattingLabel.snp.trailing).offset(7)
        }
        
        settingIconButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(17)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.width.height.equalTo(19)
        }
        
        plusIconButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(17)
            $0.trailing.equalTo(settingIconButton.snp.leading).inset(-12)
            $0.width.height.equalTo(19)
        }
        
        chattingTableView.snp.makeConstraints {
            $0.top.equalTo(chattingLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        chattingTableView.delegate = self
        chattingTableView.dataSource = self
    }
    
    private func presentToAlbumVC() {
        let albumVC = AlbumViewController()
        albumVC.modalPresentationStyle = .fullScreen
        self.present(albumVC, animated: true, completion: nil)
    }
    
    // MARK: - @objc Methods
    
    @objc private func plusIconButtonDidTap() {
        presentToAlbumVC()
    }
}

// MARK: - UITableViewDataSource

extension ChattingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chattingModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: ChattingTableViewCell.self, indexPath: indexPath)
        cell.setDataBind(model: chattingModel[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ChattingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ChattingHeaderView.identifier) as? ChattingHeaderView else { return UIView() }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
