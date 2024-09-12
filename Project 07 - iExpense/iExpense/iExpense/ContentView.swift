//
//  ContentView.swift
//  iExpense
//
//  Created by Endre Imecs on 11/8/22.
//

import SwiftUI

struct PersonalExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

struct BusinessExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

class PersonalExpenses: ObservableObject {
    @Published var personalItems = [PersonalExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(personalItems) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([PersonalExpenseItem].self, from: savedItems) {
                personalItems = decodedItems
                return
            }
        }
        
        personalItems = []
    }
}

class BusinessExpenses: ObservableObject {
    @Published var businessItems = [BusinessExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(businessItems) {
                UserDefaults.standard.set(encoded, forKey: "businessItems")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "businessItems") {
            if let decodedItems = try? JSONDecoder().decode([BusinessExpenseItem].self, from: savedItems) {
                businessItems = decodedItems
                return
            }
        }
        
        businessItems = []
    }
}

struct ContentView: View {
    @StateObject var personalExpenses = PersonalExpenses()
    @StateObject var businessExpenses = BusinessExpenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(personalExpenses.personalItems) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            Text(item.amount, format: .currency(code: "USD"))
                                .foregroundColor(item.amount < 10 ? .red : item.amount < 100 ? .green : .blue)
                        }
                    }
                    .onDelete(perform: removePersonalItems)
                }
                
                ForEach(businessExpenses.businessItems) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                            .foregroundColor(item.amount < 10 ? .red : item.amount < 100 ? .green : .blue)
                    }
                }
                .onDelete(perform: removeBusinessItems)
                Section {
                    
                }
            }
            .toolbar {
                NavigationLink(destination: AddView(personalExpenses: personalExpenses, businessExpenses: businessExpenses)) {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("iExpense")
            .sheet(isPresented: $showingAddExpense) {
                AddView(personalExpenses: personalExpenses, businessExpenses: businessExpenses)
            }
        }
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        personalExpenses.personalItems.remove(atOffsets: offsets)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        businessExpenses.businessItems.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

