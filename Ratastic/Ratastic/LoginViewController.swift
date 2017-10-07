//
//  LoginViewController.swift
//  Ratastic
//
//  Created by Colby Tobin on 10/7/17.
//  Copyright © 2017 Team Raid. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        if (UserDefaults.standard.object(forKey: "userArray") as? NSMutableArray) == nil {
            let mutableArray = NSMutableArray()
            UserDefaults.standard.set(mutableArray, forKey: "userArray")
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginUser(_ sender: Any) {
        
        guard let userArray = UserDefaults.standard.object(forKey: "userArray") as? NSMutableArray else {
            return
        }
        let logUser = User(name: "", email: emailField.text ?? "", password: passField.text ?? "")
        for obj in userArray {
            guard let user = obj as? User else { return }
            if user.isEqual(logUser) {
                //found correct user
                User.currentUser = user
            }
        }
        
        
    }

}
