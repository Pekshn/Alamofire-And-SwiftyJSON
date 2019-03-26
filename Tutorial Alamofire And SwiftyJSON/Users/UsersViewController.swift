//
//  UsersViewController.swift
//  Tutorial Alamofire And SwiftyJSON
//
//  Created by user on 3/26/19.
//  Copyright © 2019 Pekshn. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class UsersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var usersData: [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 50
        self.tableView.register(UINib(nibName: "UsersTableViewCell", bundle: nil), forCellReuseIdentifier: "userCell")
        fetchUsersData()
    }

    
    func fetchUsersData() {
        DispatchQueue.main.async {
            request("https://gorest.co.in/public-api/users?_format=json&access-token=_euGvbDbSSVckcUwR5gAILdGoCyF0wcBgilv").responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let data = json["result"]
                    print(data)
                    data.array?.forEach({ (user) in
                        let user = UserModel(name: user["name"].stringValue, email: user["email"].stringValue)
                        self.usersData.append(user)
                    })
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
        }
    }
}

extension UsersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UsersTableViewCell
        cell.nameLabel.text = self.usersData[indexPath.row].name
        cell.emailLabel.text = self.usersData[indexPath.row].email
        return cell
    }
}
