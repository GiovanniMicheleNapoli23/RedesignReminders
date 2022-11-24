//
//  ViewModel.swift
//  ToDoListBasic
//
//  Created by Giovanni Michele on 19/11/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var items: [ToDoItem] = [] {
        didSet {
            saveItem()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey), 
            let savedItems = try?  JSONDecoder().decode([ToDoItem].self, from: data)
        else { return }
        
        self.items = savedItems
         
    }
    
    func editList() {
        
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String, category: String) {
        let newItem = ToDoItem(itemName: title, isCompleted: false, category: category)
        items.append(newItem)
    }
    
    func uptateItem(item: ToDoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.uptateCompletion()
        }
    }
    
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
