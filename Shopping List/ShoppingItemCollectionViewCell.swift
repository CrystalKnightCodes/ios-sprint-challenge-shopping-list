//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Christy Hicks on 10/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    // MARK: - View
    var item: ShoppingItem? {
            didSet {
                updateViews()
            }
    }

    func updateViews() {
        guard let item = item else { return }
        
            itemNameLabel.text = item.name
            addedLabel.text = item.hasBeenAdded ? "Added" : "Not Added"
            imageView.image = UIImage(named: item.name)
    }
    
    // MARK: Methods
  
    /*func addToCart(item: ShoppingItem){
        if let index = indexFromItem(item: item) {
            item.hasBeenAdded.toggle()
        }
    }
    private func indexFromItem(item: ShoppingItem) -> Int?{
        guard let index = shoppingItems.firstIndex(of: item) else { return nil}
        return index
    }
 */
    
}

