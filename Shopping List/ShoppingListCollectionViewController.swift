//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Christy Hicks on 10/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "itemCell"

class ShoppingListCollectionViewController: UICollectionViewController {

    // MARK: - Properties
    // Initialize ShoppingItemController
    let shoppingItemController = ShoppingItemController()

    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Data Source

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItemController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
    
        let shoppingItem = shoppingItemController.shoppingList[indexPath.item]
        cell.item = shoppingItem

        shoppingItemController.saveToPersistentStore()
    
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "sendOrderSegue":
            guard segue.destination is SendOrderViewController else { return }
            default:
                fatalError("Did not find a segue")
        }
    }

    // FIXME: Only the first cell changes with cell selection.
    // Toggle cell to display "Added" or "Not Added"
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let shoppingItem = shoppingItemController.shoppingList[indexPath.item]
        shoppingItemController.toggleListed(item: shoppingItem)
        collectionView.reloadItems(at: [indexPath])
    }
}
