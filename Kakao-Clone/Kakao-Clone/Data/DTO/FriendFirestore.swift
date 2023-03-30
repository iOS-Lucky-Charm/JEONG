//
//  Firestore.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/30.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

final class FriendFirestore {
    
    private var documentListener: ListenerRegistration?
    
    func fecthFriendList(id: String, completion: @escaping (Result <[FriendListResponse], FirestoreError>) -> Void) {
//        removeListener()
        let collectionListener = Firestore.firestore().collection("member")
        documentListener = collectionListener.addSnapshotListener { snapshot, error in
            guard let snapshot = snapshot else {
//                print("firestore error")
                completion(.failure(FirestoreError.firestoreError(error)))
                return
            }
            var friendList = [FriendListResponse]()
            snapshot.documentChanges.forEach { change in
                switch change.type {
                case .added, .modified:
                    do {
                        if let list = try change.document.data(as: FriendListResponse.self) as FriendListResponse? {
                            friendList.append(list)
                            print(friendList)
                        }
                    } catch {
//                        print("catch error")
                        completion(.failure(.decodedError(error)))
                    }
                default: break
                }
            }
            completion(.success(friendList))
        }
    }
}
