//
//  FriendListModel.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/03.
//

import Foundation

struct FriendListModel {
    let friendProfile: String
    let friendName: String
    let friendStatusMessage: String
    
    public static func friendListModelDummyData() -> [FriendListModel] {
        return [
            FriendListModel(
                friendProfile: "profileImage1",
                friendName: "권채영",
                friendStatusMessage: "일본어공부화이팅"),
            FriendListModel(
                friendProfile: "profileImage1",
                friendName: "권채영",
                friendStatusMessage: "일본어공부화이팅"),
            FriendListModel(
                friendProfile: "profileImage1",
                friendName: "권채영",
                friendStatusMessage: "일본어공부화이팅"),
            FriendListModel(
                friendProfile: "profileImage1",
                friendName: "권채영",
                friendStatusMessage: "일본어공부화이팅"),
            FriendListModel(
                friendProfile: "profileImage1",
                friendName: "권채영",
                friendStatusMessage: "일본어공부화이팅"),
            FriendListModel(
                friendProfile: "profileImage1",
                friendName: "권채영",
                friendStatusMessage: "일본어공부화이팅"),
            FriendListModel(
                friendProfile: "profileImage1",
                friendName: "권채영",
                friendStatusMessage: "일본어공부화이팅"),
            FriendListModel(
                friendProfile: "profileImage1",
                friendName: "권채영",
                friendStatusMessage: "일본어공부화이팅"),
            FriendListModel(
                friendProfile: "profileImage1",
                friendName: "권채영",
                friendStatusMessage: "일본어공부화이팅")
        ]
    }
}
