//
//  UserNetworkManager.swift
//  RxMvvmMoyaCoordinatorDemoTwo
//
//  Created by Aya on 7/23/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class UserNetworkManager  {
    
    let provider = MoyaProvider<UserService>()
    let bag = DisposeBag()
    
    func getUsers() -> Single<[UserElement]> {
        return provider.rx.request(.fetchUser)
            .filterSuccessfulStatusAndRedirectCodes()
            .map([UserElement].self)
    }
}






/*
 func getUsers() -> Observable<[UserElement]> {
     
     return Observable.create{ observer -> Disposable in
         self.provider.rx.request(.fetchUser).subscribe{ event in
             
             switch event{
             case .success(let response):
                 break
             case .error(let error):
                 print("Error occured in netwrok manager \(error)")
                 
             }
         }.disposed(by: self.bag)
         return Disposables.create()
     }
     
 }
 */
