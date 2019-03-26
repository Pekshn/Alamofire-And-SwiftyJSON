//
//  UsersTableViewCell.swift
//  Tutorial Alamofire And SwiftyJSON
//
//  Created by user on 3/26/19.
//  Copyright © 2019 Pekshn. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
