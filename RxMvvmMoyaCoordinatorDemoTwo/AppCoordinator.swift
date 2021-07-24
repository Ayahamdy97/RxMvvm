//
//  AppCoordinator.swift
//  RxMvvmMoyaCoordinatorDemoTwo
//
//  Created by Aya on 7/23/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import UIKit

class AppCoordinator{
    
    private let window:UIWindow
    
    init(window:UIWindow) {
        self.window = window
    }
    
    func start()  {
        let viewController = ViewController()
        
        let navigation = UINavigationController(rootViewController:  viewController.instaniate())
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        
    }
}
