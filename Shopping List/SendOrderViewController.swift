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
    // Send alert when "Send Order" button is pressed.
    @IBAction func sendOrderAction(_ sender: UIButton) {
        
        guard let name = nameTextField.text,
        let address = addressTextField.text else { return }
        if name == "" || address == "" {
            let alert = UIAlertController(title: "Invalid Entry", message: "Please fill out both the name and address fields so we can send your order.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        
        } else {
        let alert = UIAlertController(title: "Delivery for \(name).", message: "Your items will be delivered to \(address) in 15 minutes!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
        }
    }
}
