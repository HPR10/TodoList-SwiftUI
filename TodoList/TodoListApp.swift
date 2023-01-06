//
//  TodoListApp.swift
//  TodoList
//
//  Created by HP on 02/01/23.
//

import SwiftUI

/*
 Arquitetura MVVM
 
 model - lógica do negócio
 view - inteface gráfica
 viewModel - verificação da lógica do regócio refletindo na view
 */

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
 
