//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Christy Hicks on 10/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItem: Codable {
    let name: String
    var hasBeenAdded: Bool
    let image: String

    
    init(name: String) {
        self.name = name
        self.hasBeenAdded = false
        self.image = name
    }
}
