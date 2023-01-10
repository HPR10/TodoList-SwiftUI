//
//  ItemModel.swift
//  TodoList
//
//  Created by HP on 03/01/23.
//

import Foundation


struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let iscompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, iscompleted: Bool) {
        self.id = id
        self.title = title
        self.iscompleted = iscompleted
    }
    
    func udpateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, iscompleted: !iscompleted)
    }
}




/*
 - UUID
 - uuidString
 */
