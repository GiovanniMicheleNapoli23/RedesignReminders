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
    @State var sectionName = "First category"
    @State var listName = "Flagged"
    @State var category: String = ""
    
    var body: some View {
        List {
            Section(content: {
                NavigationLink(destination: ListView(sectionName: $sectionName, category: "First")) {
                    CategoriesRowView(title: "First category")
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
                NavigationLink(destination: ListView(sectionName: $listName, category: "Flagged")) {
                    MyListsRowView(title: "Flagged")
                }.onTapGesture {
                    category = "Flagged"
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
                    }
                label: {
                    Image(systemName: "folder.badge.plus")
                }
                .sheet(isPresented: $showSheetList) {
                    AddListView()
                }
                }
            })
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button("Edit List", action: viewModel2.editList)
                }                                                                            label: {
                    Label("Add Item", systemImage: "ellipsis.circle")
                }
            }
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    Button {
                        showSheetList.toggle()
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


