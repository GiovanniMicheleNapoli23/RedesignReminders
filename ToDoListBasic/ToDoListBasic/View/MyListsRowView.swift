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
                Image(systemName: "flag.fill")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(8)
                    .background {
                        Circle()
                        .foregroundColor(.orange)
                           
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
