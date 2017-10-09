//
//  User.swift
//  Ratastic
//
//  Created by Colby Tobin on 10/7/17.
//  Copyright © 2017 Team Raid. All rights reserved.
//

import UIKit

class User: NSObject, NSCoding {

    
    static var currentUser: User?
    
    fileprivate var name: String = ""
    fileprivate var email: String = ""
    fileprivate var password: String = ""
    

    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        email = aDecoder.decodeObject(forKey: "email") as? String ?? ""
        password = aDecoder.decodeObject(forKey: "password") as? String ?? ""
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(email, forKey: "email")
        coder.encode(password, forKey: "password")
    }
    
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
    
    class func convertUsersToData(users: NSMutableArray) -> Data {
        let data = NSKeyedArchiver.archivedData(withRootObject: users)
        return data
    }
    
    class func convertDataToUsers(data: Data) -> NSMutableArray {
        let users = (NSKeyedUnarchiver.unarchiveObject(with: data) as? NSMutableArray)?.mutableCopy() as? NSMutableArray
        return users ?? NSMutableArray()
    }
    
}
