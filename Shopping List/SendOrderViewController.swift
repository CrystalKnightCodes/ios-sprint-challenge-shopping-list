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
        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        // numberOfItemsLabel.text = "You currently have \() items in your shopping list."
    }
    
    // MARK: - Action
   
    @IBAction func sendOrderAction(_ sender: UIButton) {
        // Configure
    }
   
    // MARK: - Methods

    
}
