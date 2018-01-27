//
//  LoginController.swift
//  FireBaseChat
//
//  Created by Alan Casas on 27/1/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import UIKit
import Firebase

var reference :  DatabaseReference!
let dataBaseURL = "https://fir-chat-ece81.firebaseio.com/"

class LoginController: UIViewController {

    @IBOutlet weak var textViews: UIView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    @IBAction func registerButton(_ sender: UIButton) {
        handleRegister()
    }
}

extension LoginController{
    
    func setupUI()  {
        
        view.backgroundColor = UIColor(red: 61, green: 91, blue: 151)
        
        textViews.layer.cornerRadius = 5
        textViews.layer.masksToBounds = true
        
        registerButton.backgroundColor = UIColor(red: 80, green: 101, blue: 161)
        registerButton.layer.cornerRadius = 5
        registerButton.layer.masksToBounds = true
        
    }
}

extension LoginController{
    func handleRegister(){
        
        guard let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text else {
            print("Form is not complete")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil{
                print(error?.localizedDescription as Any)
                return
            }
            
            guard let uid = user?.uid else{
                return
            }
            
            let reference = Database.database().reference(fromURL: dataBaseURL)

            let userValues = ["name" : name, "email" : email]
            
            let usersReference = reference.child("users").child(uid)
            
            usersReference.updateChildValues(userValues, withCompletionBlock: { (error, ref) in
                if error != nil{
                    print(error as Any)
                    return
                }
                
                print("Usuario guardado")
            })
            
        }
            
    }
}

extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
















