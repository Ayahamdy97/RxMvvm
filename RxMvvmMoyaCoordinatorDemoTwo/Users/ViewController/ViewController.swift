//
//  ViewController.swift
//  RxMvvmMoyaCoordinatorDemoTwo
//
//  Created by Aya on 7/23/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class ViewController: UIViewController {
    
    var viewModel = UserViewModel()
    let bag = DisposeBag()
    
    @IBOutlet weak var usersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure()  {
        
        viewModel.fetchUsers().observeOn(MainScheduler.instance).bind(to: usersTableView.rx.items(cellIdentifier: "UsersTableViewCell", cellType: UsersTableViewCell.self)){ index,model,cell in
            cell.hideAnimation()
            cell.configure(user: model)
        }.disposed(by: bag)
        
        
        viewModel.errorSubject.observeOn(MainScheduler.instance).subscribe(onNext: { (error) in
            print("☹️")
           //show popup
        }).disposed(by: bag)
    }
    
    func instaniate() -> ViewController  {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateInitialViewController() as! ViewController
        return vc
    }
    
    
}

