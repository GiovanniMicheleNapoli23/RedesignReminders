//
//  ListView.swift
//  ToDoListBasic
//
//  Created by Giovanni Michele on 17/11/22.
//

import SwiftUI

struct ListView: View {
   /* init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue]
    }*/
    
    @State var showingSheetTest = false
    @EnvironmentObject var viewModel: ViewModel
    @State var selectedItems: Set<UUID> = []
    @Binding var sectionName : String
    var category: String
    
    var body: some View {
        List(selection: $selectedItems) {
            ForEach(viewModel.items) { item in
                if item.category == category {
                    ListRowView(item: item)
                        .onTapGesture {
                            withAnimation(.linear) {
                                viewModel.uptateItem(item: item)
                            }
                        }
                }
            }
            .onDelete(perform: viewModel.deleteItem)
            .onMove(perform: viewModel.moveItem)
        }
        .padding(.top, 20)
        .listStyle(.plain)
        .toolbar(content: {
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    Button {
                        showingSheetTest.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .font(.title3.bold())
                            Text("New Reminder")
                                .font(.title3.bold())
                        }
                    }
                    Spacer()
                        .sheet(isPresented: $showingSheetTest) {
                            NewItemToList(category: category)
                            //add new row to list
                        }
                }
                
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        })
        .navigationTitle("\(sectionName)")
    }
    
}
/*
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView(sectionName: .constant("Placeholder"))
        }
        .environmentObject(ViewModel())
    }
}
*/
