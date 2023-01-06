//
//  AddView.swift
//  TodoList
//
//  Created by HP on 02/01/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false

    var body: some View {
        ScrollView{
            VStack {
                TextField("Escreva algo aqui", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.yellow)
                    .cornerRadius(10)
                // verificar como que coloca backfround swiftUI
                
                Button(action: saveButtonPressed, label: {
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
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsApropriate() {
            listViewModel.addItem(title: textFieldText)
            // voltar para a tela anterior ao clicar no save
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsApropriate() -> Bool {
        if textFieldText.count <= 0 {
            alertTitle = "Por favor inserir algum texto ✌🏻 "
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
