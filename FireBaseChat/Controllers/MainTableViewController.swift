//
//  ViewController.swift
//  FireBaseChat
//
//  Created by Alan Casas on 27/1/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
    }

    @objc func handleLogout() {
        let loginVC = LoginController()
        present(loginVC, animated: true, completion: nil)
    }
}

