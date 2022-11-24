//
//  ListRowView.swift
//  ToDoListBasic
//
//  Created by Giovanni Michele on 17/11/22.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ToDoItem
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "circle.fill": "circle")
                .foregroundColor(item.isCompleted ? .blue : .primary)
                .font(.title2)
            Text(item.itemName)
            Spacer()
        }
    }
}
/*
struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ToDoItem(itemName: "first item", isCompleted: false)
    static var item2 = ToDoItem(itemName: "second item", isCompleted: true)
    static var item3 = ToDoItem(itemName: "third", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}*/
