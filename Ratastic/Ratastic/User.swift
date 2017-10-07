//
//  User.swift
//  Ratastic
//
//  Created by Colby Tobin on 10/7/17.
//  Copyright © 2017 Team Raid. All rights reserved.
//

import UIKit

class User: NSObject {

    
    static var currentUser: User?
    
    fileprivate var name: String = ""
    fileprivate var email: String = ""
    fileprivate var password: String = ""
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
    
    func getName() -> String {
        return name
    }
    
    func getEmail() -> String {
        return email
    }
    
    func getPassword() -> String {
        return password
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let user = object as? User {
            return user.getEmail() == self.getEmail() && user.getPassword() == self.getPassword()
        }
        
        return false
    }
    
    static func dustOff() {
        currentUser = nil
    }
    
}
