//
//  File.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/22.
//

import UIKit

struct Message: Codable {
    let id: String
    let content: String
    let url: String
    let statusMessage: String
//    let sentDate: Date
    
    init(id: String, content: String, url: String, statusMessage: String) {
        self.id = id
        self.content = content
        self.url = url
        self.statusMessage = statusMessage
//        self.sentDate = Date()
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case content
        case url
        case statusMessage
//        case sentDate
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        content = try values.decode(String.self, forKey: .content)
        url = try values.decode(String.self, forKey: .url)
        statusMessage = try values.decode(String.self, forKey: .statusMessage)
        
//        let dataDouble = try values.decode(Double.self, forKey: .sentDate)
//        sentDate = Date(timeIntervalSince1970: dataDouble)
    }
}

//extension Message: Comparable {
//    
//    static func == (lhs: Message, rhs: Message) -> Bool {
//        return lhs.id == rhs.id
//    }
//    
//    static func < (lhs: Message, rhs: Message) -> Bool {
//        return lhs.sentDate < rhs.sentDate
//    }
//}
