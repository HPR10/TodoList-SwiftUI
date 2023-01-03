//
//  AddView.swift
//  TodoList
//
//  Created by HP on 02/01/23.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Escreva algo aqui", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .cornerRadius(10)
                // verificar como que coloca backfround swiftUI
                
                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Adicione um Item 🖊")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
