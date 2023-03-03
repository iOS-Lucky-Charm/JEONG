//
//  FriendListModel.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/03.
//

import UIKit

struct FriendListModel {
    let friendProfile: UIImage
    let friendName: String
    let friendStatusMessage: String
    
    public static func friendListModelDummyData() -> [FriendListModel] {
        return [
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "일본어공부화이팅"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "일본어공부화이팅"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "일본어공부화이팅"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "일본어공부화이팅"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "일본어공부화이팅"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "일본어공부화이팅"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "일본어공부화이팅"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "일본어공부화이팅")
        ]
    }
}
