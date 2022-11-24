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
            ZStack {
                Circle()
                    .frame(height: 40)
                    .foregroundColor(.blue)
                Image(systemName: "calendar")
                        .font(.title2)
                    .foregroundColor(.white)
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
