//
//  NewMessagesTableViewController.swift
//  FireBaseChat
//
//  Created by Alan Casas on 29/1/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import UIKit
import Firebase

class NewMessagesTableViewController: UITableViewController {

    let cellID = "NewMessagesCell"
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        tableView.register(UserCell2.self, forCellReuseIdentifier: cellID)
 
        fetchUserFromFireBase()
        
    }
    
    @objc func handleCancel()  {
        dismiss(animated: true)
    }
}

extension NewMessagesTableViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let userToShow = users[indexPath.row]
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil{
            cell = UserCell2(style: .default, reuseIdentifier: cellID)
        }
        
        cell?.textLabel?.text = userToShow.name
        cell?.detailTextLabel?.text = userToShow.email
        
        return cell!
    }
}

extension NewMessagesTableViewController{
    func fetchUserFromFireBase(){
        Database.database().reference().child("users").observe(.childAdded) { (snapshot) in
            
            if let userDictionary = snapshot.value as? [String: Any]{
                let user = User(name: (userDictionary ["name"] as? String)!, email: (userDictionary ["email"] as? String)!)
//                print(user.name, user.email)
                self.users.append(user)
                
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
                
            }
            
        }
        
    }
}























