//
//  MyFirestore.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/22.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

final class MyFirestore {
    
    private var documentListener: ListenerRegistration?
    
//    func save(_ message: Message, completion: ((Error?) -> Void)? = nil) {
//        let collectionPath = "channels/\(message.id)/member"
//        let collectionListener = Firestore.firestore().collection(collectionPath)
//        
//        guard let dictionary = message.asDictionary else {
//            print("decode error")
//            return
//        }
//        collectionListener.addDocument(data: dictionary) { error in
//            completion?(error)
//        }
//    }

    func subscribe(id: String, completion: @escaping (Result<[Message], FirestoreError>) -> Void) {
        let collectionPath = "channels/\(id)/member"
        removeListener()
        let collectionListener = Firestore.firestore().collection(collectionPath)
        
        documentListener = collectionListener
            .addSnapshotListener { snapshot, error in
                guard let snapshot = snapshot else {
                    completion(.failure(FirestoreError.firestoreError(error)))
                    return
                }
                
                var messages = [Message]()
                snapshot.documentChanges.forEach { change in
                    switch change.type {
                    case .added, .modified:
                        do {
                            if let message = try change.document.data(as: Message.self) as Message? {
                                messages.append(message)
                            }
                        } catch {
                            completion(.failure(.decodedError(error)))
                        }
                    default: break
                    }
                }
                completion(.success(messages))
            }
    }
    
//    func friendListSubscribe(id: String, completion: @escaping (Result<[FriendListResponse], FirestoreError>) -> Void) {
//        let collectionPath = "channels/\(id)/friendList"
//        removeListener()
//        let collectionListener = Firestore.firestore().collection(collectionPath)
//        
//        documentListener = collectionListener
//            .addSnapshotListener { snapshot, error in
//                guard let snapshot = snapshot else {
//                    completion(.failure(FirestoreError.firestoreError(error)))
//                    return
//                }
//                
//                var friendLists = [FriendListResponse]()
//                snapshot.documentChanges.forEach { change in
//                    switch change.type {
//                    case .added, .modified:
//                        do {
//                            if let friendList = try change.document.data(as: FriendListResponse.self) as FriendListResponse? {
//                                friendLists.append(friendList)
//                            }
//                        } catch {
//                            completion(.failure(.decodedError(error)))
//                        }
//                    default: break
//                    }
//                }
//                completion(.success(friendLists))
//            }
//    }
    
    func removeListener() {
        documentListener?.remove()
    }
}
