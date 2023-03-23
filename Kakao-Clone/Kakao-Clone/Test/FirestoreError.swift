//
//  FirestoreError.swift
//  Kakao-Clone
//
//  Created by KJ on 2023/03/22.
//

import Foundation

enum FirestoreError: Error {
    case firestoreError(Error?)
    case decodedError(Error?)
}
