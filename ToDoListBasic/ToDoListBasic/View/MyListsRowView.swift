//
//  MyListsRowView.swift
//  ToDoListBasic
//
//  Created by Giovanni Michele on 18/11/22.
//

import SwiftUI

struct MyListsRowView: View {
    
    var title: String
    
    var body: some View {
        HStack {
                Image(systemName: "list.bullet")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(10)
                    .background {
                        Circle()
                        .foregroundColor(.purple)
                           
                    }
            Text(title)
            Spacer()
        }
    }
}

struct MyListsRowView_Previews: PreviewProvider {
    static var previews: some View {
        MyListsRowView(title: "My First List")
    }
}
