//
//  PrincipalView.swift
//  ToDoListBasic
//
//  Created by Giovanni Michele on 18/11/22.
//

import SwiftUI

struct PrincipalView: View {
    
    @ObservedObject var viewModel2 = ViewModel()
    @State var searchableText: String = ""
    @State var showSheetList = false
    @State var sectionName = "Calendar"
    @State var listName = "Reminders"
    @State var category: String = ""
    
    var body: some View {
        List {
            Section(content: {
                NavigationLink(destination: ListView(sectionName: $sectionName, category: "First")) {
                    CategoriesRowView(title: "Calendar")
                }.onTapGesture {
                    category = "First"
                }
            },
                    header: {
                Text("Categories")
                    .font(.title3.bold())
                    .textCase(.none)
                    .foregroundColor(.primary)
                
            })
            
            Section(content: {
                NavigationLink(destination: ListView(sectionName: $listName, category: "Reminders")) {
                    MyListsRowView(title: "Reminders")
                }.onTapGesture {
                    category = "Reminders"
                }
                
            },
                    header: {
                HStack {
                    Text("My Lists")
                        .font(.title3.bold())
                        .textCase(.none)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Button {
                        showSheetList.toggle()
                        HapticManager.instance.impact(style: .rigid)
                    }
                label: {
                    Image(systemName: "folder.badge.plus")
                }
                .sheet(isPresented: $showSheetList) {
                    NewItemToList(category: "first")
                }
                }
            })
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button("Edit List", action: viewModel2.editList)
                    
                }                                                          label: {
                    Label("Add Item", systemImage: "ellipsis.circle")
                }
            }
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    Button {
                        showSheetList.toggle()
                        HapticManager.instance.impact(style: .heavy)
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .font(.title3.bold())
                            Text("New Reminder")
                                .font(.title3.bold())
                        }
                    }
                    Spacer()
                        .sheet(isPresented: $showSheetList) {
                            NewReminderView()
                        }
                    
                }
            }
        }
        .searchable(text: $searchableText)
    }
}


struct PrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PrincipalView()
        }
        .environmentObject(ViewModel())
    }
}


