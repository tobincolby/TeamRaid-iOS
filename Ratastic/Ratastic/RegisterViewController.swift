//
//  RegisterViewController.swift
//  Ratastic
//
//  Created by Colby Tobin on 10/7/17.
//  Copyright © 2017 Team Raid. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var confirmPassField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        if (UserDefaults.standard.object(forKey: "userArray") as? NSMutableArray) == nil {
            let mutableArray = NSMutableArray()
            UserDefaults.standard.set(mutableArray, forKey: "userArray")
        }
    }


    @IBAction func registerUser(_ sender: Any) {
        
        guard let userArray = UserDefaults.standard.object(forKey: "userArray") as? NSMutableArray
            else { return }
        
        if passField.text == confirmPassField.text {
            
            for obj in userArray {
                guard let user = obj as? User else { return }
                if user.getEmail() == emailField.text {
                    //user already exists
                    return
                }
            }
            
            let newUser = User(name: nameField.text ?? "", email: emailField.text ?? "", password: passField.text ?? "")
            userArray.add(newUser)
            UserDefaults.standard.set(userArray, forKey: "userArray")
            
            performSegue(withIdentifier: "welcomePage", sender: self)
        }
        
    }

}
