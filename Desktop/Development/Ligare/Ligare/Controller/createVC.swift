//
//  createVC.swift
//  Ligare
//
//  Created by Egor Antipov on 11/19/18.
//  Copyright © 2018 Egor Antipov. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import UIKit

class createVC : UIViewController {
    
    let posts = DB_BASE.child("posts")
    
    
    // Variables
    @IBOutlet weak var listingTextView: UITextView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listingTextView.delegate = self
    }
    
    // Send Button
    
    @IBAction func sendListing(_ sender: Any) {
        if listingTextView.text != nil && listingTextView.text != "Say something here..." {
            sendButton.isEnabled = false
            DataService.instance.uploadPost(withMessage: listingTextView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, sendComplete: { (isComplete) in
                if isComplete {
                    self.sendButton.isEnabled = true
                    // self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendButton.isEnabled = true
                    print("There was an error!")
                }
            })
        }
    }
}

extension createVC : UITextViewDelegate {
    func textViewDidBeginEditing(_ listingTextView: UITextView) {
        listingTextView.text = ""
    }
}
