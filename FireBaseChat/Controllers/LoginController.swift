//
//  LoginController.swift
//  FireBaseChat
//
//  Created by Alan Casas on 27/1/18.
//  Copyright © 2018 Alan Casas. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var textViews: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    @IBAction func registerButton(_ sender: UIButton) {
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


extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
