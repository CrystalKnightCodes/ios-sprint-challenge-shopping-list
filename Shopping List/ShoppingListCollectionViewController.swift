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
    let shoppingItemController = ShoppingItemController()
    var numberOfItemsAdded = 0
    
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
    
    // MARK: - Methods
        func numberOfItems() -> Int {
        for item in shoppingItemController.shoppingList {
            if item.hasBeenAdded {
                numberOfItemsAdded += 1
            }
        }
        return numberOfItemsAdded
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "sendOrderSegue":
            guard let sendOrderVC = segue.destination as? SendOrderViewController else { return }
           // sendOrderVC.
            default:
                fatalError("Did not find a segue")
            }
    }


    // MARK: UICollectionViewDelegate

    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
