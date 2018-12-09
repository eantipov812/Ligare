//
//  homeVC.swift
//  Ligare
//
//  Created by Egor Antipov on 11/19/18.
//  Copyright © 2018 Egor Antipov. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class homeVC : UIViewController {
    
    // let posts = DB_BASE.child("posts")
    var messageArray = [listing]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (returnedMessagesArray) in
            self.messageArray = returnedMessagesArray
            self.tableView.reloadData()
            self.configureTableView()
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func logoutButton(_ sender: Any) {
        do {
          try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signInVC = storyboard.instantiateViewController(withIdentifier: "loginVC")
        self.present(signInVC, animated: true, completion: nil)
    }
    
    //TODO: Declare configureTableView here:
    func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120.0
    }
    
}

extension homeVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell else {
            return UITableViewCell()
        }
        let message = messageArray[indexPath.row]
        cell.configureCell(email: message.senderID, content: message.content)
        return cell
    }
    
    
}
