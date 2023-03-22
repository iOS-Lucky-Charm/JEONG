//
//  Encodable +.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/22.
//

import UIKit

extension Encodable {
    
    // Object to Dictionary
    // cf) Dictionary to Object: JSONDecoder().decode(Object.self, from: dictionary)
    
    var asDictionary: [String: Any]? {
        guard let object = try? JSONEncoder().encode(self),
              let dictinoary = try? JSONSerialization.jsonObject(with: object, options: []) as? [String: Any] else { return nil }
        return dictinoary
    }
}
