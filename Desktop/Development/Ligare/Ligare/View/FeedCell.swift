//
//  FeedCell.swift
//  Ligare
//
//  Created by Egor Antipov on 11/19/18.
//  Copyright © 2018 Egor Antipov. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var contentMessage: UILabel!
    
    func configureCell(email: String, content: String){
        self.username.text = email
        self.contentMessage.text = content
    }
    
    
    
}
