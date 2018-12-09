//
//  loginVC.swift
//  Ligare
//
//  Created by Egor Antipov on 11/19/18.
//  Copyright © 2018 Egor Antipov. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class loginVC : UIViewController {
    
    // Text Fields
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // Login Button
    @IBAction func loginButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            } else {
                self.performSegue(withIdentifier: "loginToMain", sender: self)
            }
        }
        
    }
    
    // Switch Screen Button
    @IBAction func toRegisterButton(_ sender: Any) {
        performSegue(withIdentifier: "loginToRegister", sender: self)
    }
    
    
}
