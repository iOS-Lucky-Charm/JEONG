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
        
        plusIconImage.do {
            $0.image = Image.plusIcon
        }
        
        settingIconImage.do {
            $0.image = Image.settingIcon
        }
        
        chattingTableView.do {
            $0.backgroundColor = .white
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
            $0.registerCell(ChattingTableViewCell.self)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(chattingLabel, openChattingLabel, plusIconImage, settingIconImage, chattingTableView)
        
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
        
        chattingTableView.snp.makeConstraints {
            $0.top.equalTo(chattingLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        chattingTableView.delegate = self
        chattingTableView.dataSource = self
    }
}

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

extension ChattingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
