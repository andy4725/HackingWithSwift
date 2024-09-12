//
//  AddView.swift
//  iExpense
//
//  Created by Endre Imecs on 11/11/22.
//

import SwiftUI

struct AddView: View {
    @State private var name = "Add new expense"
    @State private var type = "Personal"
    @State private var amount = 0.0
    @ObservedObject var personalExpenses: PersonalExpenses
    @ObservedObject var businessExpenses: BusinessExpenses
    @Environment(\.dismiss) var dismiss
    
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationView {
            Form {
//                TextField("Name", text: $name)
//                    .autocapitalization(.none)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Save") {
                    if type == "Personal" {
                        let item = PersonalExpenseItem(name: name, type: type, amount: amount)
                        personalExpenses.personalItems.append(item)
                        dismiss()
                    } else {
                        let item = BusinessExpenseItem(name: name, type: type, amount: amount)
                        businessExpenses.businessItems.append(item)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(personalExpenses: PersonalExpenses(), businessExpenses: BusinessExpenses())
    }
}
