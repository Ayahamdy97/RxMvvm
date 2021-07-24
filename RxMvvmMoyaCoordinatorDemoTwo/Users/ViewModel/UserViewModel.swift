//
//  UserViewModel.swift
//  RxMvvmMoyaCoordinatorDemoTwo
//
//  Created by Aya on 7/23/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
class UserViewModel {
    
    var userNetworkManager:UserNetworkManager
  
    var errorSubject:PublishSubject<Error>
    var publishSub: PublishSubject<[UserElement]>
    
    let bag = DisposeBag()
    
    init() {
        userNetworkManager = UserNetworkManager()
        errorSubject = PublishSubject<Error>()
        publishSub = PublishSubject<[UserElement]>()
    }
    
    func fetchUsers() ->  PublishSubject<[UserElement]> {
        userNetworkManager.getUsers().subscribe(onSuccess: { [weak self] (users) in
            guard let self = self else {return}
            self.publishSub.onNext(users)
            print("from view model 🐤")
        }) { [weak self] (error) in
          
            guard let self = self else {return}
            print(error,"X")
            self.errorSubject.onNext(error)
        }.disposed(by: bag)
        return publishSub
    }
    
}







/*
 func fetchUsers() -> BehaviorRelay<[UserElement]> {
 let behavior = BehaviorRelay<[UserElement]>.init(value: [UserElement(id: 123, name: "ayooya", username: "ayoooooya", email: "ayooya@ayooya.com")])
 
 userNetworkManager.getUsers().subscribe(onSuccess: { (users) in
 print("✅")
 behavior.accept(users)
 }) { [weak self] (error) in
 print(error)
 guard let self = self else {return}
 self.errorSubject.onNext(error)
 
 }.disposed(by: bag)
 return behavior
 }
 */
