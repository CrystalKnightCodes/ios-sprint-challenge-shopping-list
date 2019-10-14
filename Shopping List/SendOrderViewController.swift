//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by Christy Hicks on 10/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {
// MARK: - Outlets
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
   
    //MARK: - Properties
   // var addedItems = ShoppingItemController.addedItems

    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        let shoppingList = ShoppingItemController()
        let addedItemsList = ShoppingItemController.addedItems(shoppingList)
        let number = addedItemsList().count
        numberOfItemsLabel.text = "You currently have \(number) items in your shopping list."
    }
    
    // MARK: - Action
   
    @IBAction func sendOrderAction(_ sender: UIButton) {
        let name = nameTextField.text
        let address = addressTextField.text
        let alert = UIAlertController(title: "Delivery for \(name ?? "you").", message: "Your items will be delivered to \(address ?? "your home") in 15 minutes!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
   
    // MARK: - Methods

    
}
