//
//  registerVC.swift
//  Ligare
//
//  Created by Egor Antipov on 11/19/18.
//  Copyright © 2018 Egor Antipov. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import UIKit

class registerVC : UIViewController {
    
    
    // Initialize Text Fields
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // Registration Button
    @IBAction func registerButton(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print(error!)
                return
            } else {
                let ref = Database.database().reference()
                let usersReference = ref.child("users")
                let uid = user?.user.uid
                let newUserReference = usersReference.child(uid!)
                newUserReference.setValue(["username" : self.usernameTextField.text!, "email" : self.emailTextField.text!])
                self.performSegue(withIdentifier: "registerToMain", sender: self)
            }
        }
        
    }
    
}
