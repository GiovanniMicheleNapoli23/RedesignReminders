//
//  NewItemToList.swift
//  ToDoListBasic
//
//  Created by Giovanni Michele on 21/11/22.
//

import SwiftUI

struct NewItemToList: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ViewModel
    @State private var textfield = ""
    var category: String
    let color = Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type shomething here...", text: $textfield)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button {
                    saveButtonPressed()
                } label: {
                    Text("save")
                    
                }

            }
            .navigationTitle("Add Element")
        }
       
       
    }
    func saveButtonPressed() {
        listViewModel.addItem(title: textfield, category: category)
        presentationMode.wrappedValue.dismiss()
    }
   
}
/*
struct NewItemToList_Previews: PreviewProvider {
    static var previews: some View {
      
            NewItemToList()
        
    }
}*/
