//
//  CategoriesRowView.swift
//  ToDoListBasic
//
//  Created by Giovanni Michele on 18/11/22.
//

import SwiftUI

struct CategoriesRowView: View {
    
    var title: String
    var body: some View {
        HStack {
                Image(systemName: "calendar")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(8)
                    .background {
                        Circle()
                        .foregroundColor(.accentColor)
                           
                    }
            Text(title)
            Spacer()
        }
    }
}

struct CategoriesRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesRowView(title: "First Category")
    }
}
