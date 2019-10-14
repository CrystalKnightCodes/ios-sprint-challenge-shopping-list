//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Christy Hicks on 10/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var item: ShoppingItem? {
            didSet {
                updateViews()
            }
        }

        func updateViews() {
            guard let item = item else { return }
        
            itemNameLabel.text = item.name
            if item.hasBeenAdded {
                addedLabel.text = "Added"
            } else {
                addedLabel.text = "Not Added"
            }
            imageView.image = UIImage(named: item.name)
        }
    }
