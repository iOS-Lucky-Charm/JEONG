//
//  FriendResponse.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/24.
//

import UIKit

struct FriendListResponse: Codable {
    let friendProfile: String
    let friendName: String
    let friendStatusMessage: String
    
    func convertToFriendList() -> FriendListModel {
        return FriendListModel(friendProfile: self.friendProfile, friendName: self.friendName, friendStatusMessage: self.friendStatusMessage)
    }
    
    private enum CodingKeys: String, CodingKey {
        case friendProfile
        case friendName
        case friendStatusMessage
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        friendProfile = try values.decode(String.self, forKey: .friendProfile)
        friendName = try values.decode(String.self, forKey: .friendName)
        friendStatusMessage = try values.decode(String.self, forKey: .friendStatusMessage)
    }
}
