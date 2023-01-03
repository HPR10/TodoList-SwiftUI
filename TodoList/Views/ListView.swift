//
//  ListView.swift
//  TodoList
//
//  Created by HP on 02/01/23.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "Primeiro item da lista",
        "Segundo item da lista",
        "Terceiro..."
    ]
    
    var body: some View {
        List {
            // Percorrendo os 3 elementos do array items.
            ForEach(items, id: \.self) { item in ListRowView(title: item)
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
