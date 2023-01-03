//
//  ListView.swift
//  TodoList
//
//  Created by HP on 02/01/23.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
      ItemModel(title: "Primeiro item da lista", iscompleted: false),
      ItemModel(title: "Segundo item da lista", iscompleted: true),
      ItemModel(title: "Terceiro", iscompleted: false)
    ]
    
    var body: some View {
        List {
            // Percorrendo os 3 elementos do array items.
            ForEach(items) { item in ListRowView(item: item)
             
            }
        }
        .listStyle(InsetListStyle())
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
    }
}


/*
 Estudar ForEach
 State
 */
