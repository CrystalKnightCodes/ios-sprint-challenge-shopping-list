//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Christy Hicks on 10/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItem: Codable, Equatable {
    static func == (lhs: ShoppingItem, rhs: ShoppingItem) -> Bool {
        return lhs.name == rhs.name
    }
    
    let name: String
    var hasBeenAdded: Bool
    
    init(name: String) {
        self.name = name
        self.hasBeenAdded = false
    }
}
