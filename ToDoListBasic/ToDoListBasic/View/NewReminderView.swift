//
//  NewReminderView.swift
//  ToDoListBasic
//
//  Created by Giovanni Michele on 19/11/22.
//

import SwiftUI

struct NewReminderView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Work in progress")
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
}

struct NewReminderView_Previews: PreviewProvider {
    static var previews: some View {
        NewReminderView()
    }
}
