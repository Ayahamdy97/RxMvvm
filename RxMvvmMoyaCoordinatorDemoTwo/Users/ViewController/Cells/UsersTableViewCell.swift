//
//  UsersTableViewCell.swift
//  RxMvvmMoyaCoordinatorDemoTwo
//
//  Created by Aya on 7/24/21.
//  Copyright © 2021 Aya. All rights reserved.
//

import UIKit
import SkeletonView

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        name.showAnimatedGradientSkeleton()
        email.showAnimatedSkeleton()
    }
    
    func hideAnimation() {
        name.hideSkeleton()
        email.hideSkeleton()
        
    }

    func configure(user:UserElement)   {
        name.text = user.name
        email.text = user.email
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
