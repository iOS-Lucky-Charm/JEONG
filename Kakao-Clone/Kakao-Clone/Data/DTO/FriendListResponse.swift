//
//  FriendResponse.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/24.
//

import UIKit
import Firebase

struct FriendListResponse: Codable {
    let friendProfile: String
    let friendName: String
    let friendStatusMessage: String
    
    init?(document: QueryDocumentSnapshot) {
        guard let data = document.data() as? [String: Any],
              let profile = data["imageURL"] as? String,
              let message = data["message"] as? String,
              let name = data["name"] as? String else {
            return nil
        }
        
        self.friendProfile = profile
        self.friendName = name
        self.friendStatusMessage = message
    }
    
    func convertToFriendList() -> FriendListModel {
        return FriendListModel(friendProfile: self.friendProfile, friendName: self.friendName, friendStatusMessage: self.friendStatusMessage)
    }
}
