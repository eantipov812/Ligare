//
//  listing.swift
//  Ligare
//
//  Created by Egor Antipov on 11/19/18.
//  Copyright © 2018 Egor Antipov. All rights reserved.
//

import Foundation

class listing {
    private var _content: String
    private var _senderID: String
    
    var content: String {
        return _content
    }
    
    var senderID: String {
        return _senderID
    }
    
    init(content: String, senderID: String) {
        self._content = content
        self._senderID = senderID
    }
}
