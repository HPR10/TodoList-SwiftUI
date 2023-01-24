//
//  ListView.swift
//  TodoList
//
//  Created by HP on 02/01/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    // Percorrendo os 3 elementos do array items.
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                        // controlando o marcado ou não da lista
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    // método para chamar remover o item da lista
                    .onDelete(perform: listViewModel.deleteItem)
                    // método para chamar editar o item da lista
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(InsetListStyle())
            }
        }  
        .navigationTitle("TodoList 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                // navega para uma tela só com um texto mesmo isso não tendo arquivo.
            NavigationLink("Add", destination: AddView()))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


/*
 Estudar ForEach
 State
 */
