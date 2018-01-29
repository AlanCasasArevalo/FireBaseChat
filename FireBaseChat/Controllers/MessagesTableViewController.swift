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
class MessagesTableViewController: UITableViewController {
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "message"),  style: .plain, target: self, action: #selector(handleNewMessage))
    
        isUserLoggedIn()
        
    }
    
    // MARK: - Is user logged?
    func isUserLoggedIn(){
        if Auth.auth().currentUser?.uid == nil{
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        }else{
            let uid = Auth.auth().currentUser?.uid
            
            Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                if let dictionary = snapshot.value as? [String:Any]{
                    self.navigationItem.title = dictionary["name"] as? String
                }
                
            })
            
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
    
    @objc func handleNewMessage()  {
        let newMessagesTableViewController = NewMessagesTableViewController()
        let navNewMessagesVC = UINavigationController(rootViewController: newMessagesTableViewController)
        present(navNewMessagesVC, animated: true)
    }
    
}

