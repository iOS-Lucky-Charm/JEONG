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
                friendStatusMessage: "채영아울지마"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "Don't Cry..."),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "타코야끼 먹고싶당"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "졸리다"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "헤더뷰 언제만들징"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "울지마렴..."),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "허리 아프다"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "휘융"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "과제 재미따"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "시간 좀더많아쓰면..."),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "닥터페퍼 먹고싶따"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "지금 듣는 노래좋당"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "우~~"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "걸어봐 위엄 라잌어라이언~"),
            FriendListModel(
                friendProfile: Image.friendImage1,
                friendName: "권채영",
                friendStatusMessage: "더부어 가솔린어파이어~")
        ]
    }
}
