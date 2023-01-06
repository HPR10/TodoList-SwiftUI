//
//  ItemModel.swift
//  TodoList
//
//  Created by HP on 03/01/23.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let iscompleted: Bool
}


/*
 - UUID
 - uuidString
 */
