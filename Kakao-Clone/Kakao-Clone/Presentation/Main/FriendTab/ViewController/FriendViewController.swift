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

final class FriendViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let friendLabel: UILabel = UILabel()
    private let settingImageView: UIImageView = UIImageView()
    private let myProfileHeaderView: UITableView = UITableView()
    private let friendTableView: UITableView = UITableView(frame: .zero, style: .grouped)
//    private var friendListModel: [FriendListModel] = FriendListModel.friendListModelDummyData()
    private var friendList: [FriendListModel] = []
    
    // MARK: - Properties
    
    var userName: String?
//    private let db = Firestore.firestore()
//    private var documentListener: ListenerRegistration?
    let friendFriestore = FriendFirestore()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
        fetchFirestore()
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
    
//    func fecthFriendList(completion: @escaping (Result <[FriendListResponse], FirestoreError>) -> Void) {
//        let collectionListener = db.collection("member")
//        documentListener = collectionListener.addSnapshotListener { snapshot, error in
//            guard let snapshot = snapshot else {
//                print("firestore error")
//                return
//            }
//            var friendList = [FriendListResponse]()
//            snapshot.documentChanges.forEach { change in
//                switch change.type {
//                case .added, .modified:
//                    do {
//                        if let list = try change.document.data(as: FriendListResponse.self) as FriendListResponse? {
//                            friendList.append(list)
//                            print(friendList)
//                        }
//                    } catch {
//                        print("catch error")
//                    }
//                default: break
//                }
//            }
//        }
//    }
//        db.collection("member").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            }
//            else {
//                snapshot.documentChanges.forEach { change in
//                    switch change.type {
//                    case .added, .modified:
//                        do {
//                            if let list = try document.data(as: FriendListResponse.self) as FriendListResponse? {
//                                friendList.append(list)
//                            }
//                        } catch {
//                            print("catch error")
//                        }
//                    default: break
//                    }
//                }
//                for document in querySnapshot!.documents {
//                    do {
//                        if let list = try document.data(as: FriendListResponse.self) as FriendListResponse? {
//                            friendList.append(list)
//                        }
//                    } catch {
//                        print("error")
//                    }
//                    print("\(document.documentID) => \(document.data())")
//                }
//            }
//        }
    
    func fetchFirestore() {
        friendFriestore.fecthFriendList(id: "123") { [weak self] result in
            switch result {
            case .success(let list):
                list.forEach {
                    print($0.friendName)
                }
            case .failure(let error):
                print("fetchFirestore error")
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension FriendViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
//        return 5
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
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let delete = UIContextualAction(style: .destructive, title: "삭제") {
//            (UIContextualAction, UIView, success) in
//            self.friendListModel.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            success(true)
//        }
//        delete.backgroundColor = .systemRed
//        let configuration = UISwipeActionsConfiguration(actions: [delete])
//        return configuration
//    }
}
