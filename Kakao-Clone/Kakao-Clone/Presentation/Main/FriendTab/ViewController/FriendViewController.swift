//
//  FriendViewController.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/02/13.
//

import UIKit

import SnapKit
import Then
import Firebase
import FirebaseCore
import FirebaseFirestore

final class FriendViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let friendLabel: UILabel = UILabel()
    private let settingImageView: UIImageView = UIImageView()
    private let myProfileHeaderView: UITableView = UITableView()
    private let friendTableView: UITableView = UITableView(frame: .zero, style: .grouped)
    private var friendList: [FriendListModel] = []
    
    // MARK: - Properties
    
    var userName: String?
    let db = Firestore.firestore()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firestore()
        setUI()
        setLayout()
        setDelegate()
    }
}

extension FriendViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        view.backgroundColor = .white
        
        friendLabel.do {
            $0.text = "친구"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 22, weight: .semibold)
        }
        
        settingImageView.do {
            $0.image = Image.settingIcon
        }
        
        friendTableView.do {
            $0.backgroundColor = .white
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.separatorStyle = .none
            $0.registerCell(FriendTableViewCell.self)
            $0.register(FriendHeaderView.self, forHeaderFooterViewReuseIdentifier: FriendHeaderView.identifier)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(friendLabel, settingImageView, friendTableView)
        
        friendLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(14)
        }
        
        settingImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(17)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.width.height.equalTo(19)
        }
        
        friendTableView.snp.makeConstraints {
            $0.top.equalTo(friendLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        friendTableView.delegate = self
        friendTableView.dataSource = self
    }
    
    func presentToMyProfileVC() {
        let myProfileVC = MyProfileViewController()
        myProfileVC.userName = userName
        myProfileVC.setDataBind()
        myProfileVC.modalPresentationStyle = .fullScreen
        self.present(myProfileVC, animated: true)
    }
    
    func firestore() {
        db.collection("member").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let profile = data["imageURL"] as? String ?? ""
                    let message = data["message"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let list = FriendListModel(friendProfile: profile, friendName: name, friendStatusMessage: message)
                    self.friendList.append(list)
//                    self.friendList = document.compactMap { FriendListResponse(document: $0)}
                }
                print(self.friendList)
                self.friendTableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension FriendViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: FriendTableViewCell.self, indexPath: indexPath)
        cell.setDataBind(model:friendList[indexPath.row])
        return cell
    }
}


// MARK: - UITableViewDelegate

extension FriendViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: FriendHeaderView.identifier) as? FriendHeaderView else { return UIView() }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 73
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "삭제") {
            (UIContextualAction, UIView, success) in
            self.friendList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            success(true)
        }
        delete.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [delete])
        return configuration
    }
}
