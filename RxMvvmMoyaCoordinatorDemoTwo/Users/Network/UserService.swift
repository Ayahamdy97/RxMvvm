//
//  UserService.swift
//  RxMvvmMoyaCoordinatorDemoTwo
//
//  Created by Aya on 7/23/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import Foundation
import Moya
import RxSwift


enum UserService{
    case fetchUser
    case deleteUser(id:Int)
}

extension UserService:TargetType{
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self {
        case .fetchUser:
            return "/users"
        case .deleteUser(let id):
            return "/users/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchUser:
            return .get
        default:
            return .delete
        }
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-Typer" : "application/json"]
    }
    
    
}
