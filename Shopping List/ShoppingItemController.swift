//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Christy Hicks on 10/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    // MARK: - Properties
    // Array of items
    var shoppingList: [ShoppingItem] = []
    
    // Location to save items
    private var shoppingListURL: URL? = {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("Info.plist")
    }()
    
    // MARK: - Initialize
    init() {
        if UserDefaults.standard.bool(forKey: "Initialized") {
            loadFromPersistentStore()
        } else {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            for item in itemNames {
                shoppingList.append(ShoppingItem(name: item))
            }
            saveToPersistentStore()
            UserDefaults.standard.set(true, forKey: "Initialized")
        }
    }
    
    // MARK: - Methods
    // Switch item between added and not added
    func toggleListed(item: ShoppingItem) {
        guard let itemNumber = shoppingList.firstIndex(of: item) else { return }
        shoppingList[itemNumber].hasBeenAdded.toggle()
    }
    
    // Save current list
    func saveToPersistentStore() {
        guard let url = shoppingListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let itemsData = try encoder.encode(shoppingList)
            try itemsData.write(to: url)
        } catch {
            print("Failed to save items")
        }
    }
    
    // Load recently saved list
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = shoppingListURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decodedItems = try decoder.decode([ShoppingItem].self, from: data)
            shoppingList = decodedItems
        } catch {
            print("Failed to decode items")
        }
    }
}
