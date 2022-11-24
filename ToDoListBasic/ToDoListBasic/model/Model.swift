//
//  Model.swift
//  ToDoListBasic
//
//  Created by Giovanni Michele on 18/11/22.
//

import Foundation
import SwiftUI

struct ToDoItem: Codable, Identifiable, Hashable {
    var id = UUID()
    var itemName: String
    var isCompleted: Bool
    var category: String
    
    init(id: UUID = UUID(), itemName: String, isCompleted: Bool, category: String) {
        self.id = id
        self.itemName = itemName
        self.isCompleted = isCompleted
        self.category = category
    }
    
    func uptateCompletion() -> ToDoItem {
        return ToDoItem(itemName: itemName, isCompleted: !isCompleted, category: category)
    }
    
}

struct CategoryItem: Codable, Identifiable, Hashable {
    var id = UUID()
    var categoryName: String
    var image: String
}

struct MyListItem: Identifiable {
    var id = UUID()
    var categoryName: String
    var image: String
    var isSelected : Bool
}

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .overlay(Rectangle().frame(height: 2).padding(.top, 35).foregroundColor(.blue))

            .padding(10)
    }
}
