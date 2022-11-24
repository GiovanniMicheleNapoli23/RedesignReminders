//
//  ToDoListBasicApp.swift
//  ToDoListBasic
//
//  Created by Giovanni Michele on 17/11/22.
//

import SwiftUI

@main
struct ToDoListBasicApp: App {
    
    @StateObject var viewModel = ViewModel()
     
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                PrincipalView()
            }
            .environmentObject(viewModel)
        }
    }
}
