//
//  User.swift
//  RxMvvmMoyaCoordinatorDemoTwo
//
//  Created by Aya on 7/23/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import Foundation

// MARK: - UserElement
struct UserElement: Codable {
    let id: Int?
    let name, username, email: String?
   
 
}



typealias User = [UserElement]
