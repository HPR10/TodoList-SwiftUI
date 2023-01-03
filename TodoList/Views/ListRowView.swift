//
//  ListRowView.swift
//  TodoList
//
//  Created by HP on 02/01/23.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            // if ternário
            Image(systemName: item.iscompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.iscompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "Primeiro item", iscompleted: false)
    static var item2 = ItemModel(title: "Segundo item", iscompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits) // vizualização minimalista do preview
    }
}
