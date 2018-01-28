//
//  ViewController.swift
//  FireBaseChat
//
//  Created by Alan Casas on 27/1/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import UIKit
import Firebase

// MARK: - Life Circle
class MainTableViewController: UITableViewController {
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        if Auth.auth().currentUser?.uid == nil{
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        }
    }

    // MARK: - Logout
    @objc func handleLogout() {
        
        do {
            try Auth.auth().signOut()
        } catch let logOutError {
            print(logOutError)
        }
        
        let loginVC = LoginController()
        present(loginVC, animated: true, completion: nil)
    }
}

