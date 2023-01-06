//
//  ListViewModel.swift
//  TodoList
//
//  Created by HP on 06/01/23.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItens = [
            ItemModel(title: "Primeiro item da lista", iscompleted: false),
            ItemModel(title: "Segundo item da lista", iscompleted: true),
            ItemModel(title: "Terceiro", iscompleted: false)
        ]
        items.append(contentsOf: newItens)
    }
    
    //função para apagar o item da lista
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    // função para editar os itens da lista
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, iscompleted: false)
        items.append(newItem)
    }
    
}
