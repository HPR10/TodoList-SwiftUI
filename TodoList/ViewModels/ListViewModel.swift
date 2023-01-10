//
//  ListViewModel.swift
//  TodoList
//
//  Created by HP on 06/01/23.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        // toda vez que o objeto seja modificado a função de save roda.
        didSet {
            saveItems()
        }
    }
    
    var itemsKey: String = "items_key"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItens = [
//            ItemModel(title: "Primeiro item da lista", iscompleted: false),
//            ItemModel(title: "Segundo item da lista", iscompleted: true),
//            ItemModel(title: "Terceiro", iscompleted: false)
//        ]
//        items.append(contentsOf: newItens)
        
        // persistindo dados no dispositio com userDefaults
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = savedItems
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
    
    func updateItem(item: ItemModel) {
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        } {
//            // run this code
//        }
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.udpateCompletion()
        }
    }
    // função que converte a lista para o padrão de salve o dispositivo
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
