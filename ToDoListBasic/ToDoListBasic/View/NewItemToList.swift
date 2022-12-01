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
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type shomething here...", text: $textfield)
                    .underlineTextField()
                    .frame(maxWidth: .infinity, minHeight: 55)
                    .padding()
                    .foregroundColor(.primary)
                    .shadow(radius: 7)
                    
                Button {
                    saveButtonPressed()
                    HapticManager.instance.notification(type: .success)
                } label: {
                    Text("Add to List 🖊️")
                        .foregroundColor(.white)
                        .font(.headline.bold())
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background {
                            Color.accentColor
                            .cornerRadius(15)
                            .shadow(color: .accentColor, radius: 10)
                            
                        }
                        .padding(50)
                        
                    
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

struct NewItemToList_Previews: PreviewProvider {
    static var previews: some View {
        
        NewItemToList(category: "first")
        
    }
}
