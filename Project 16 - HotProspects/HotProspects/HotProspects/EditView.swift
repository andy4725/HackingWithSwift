//
//  EditView.swift
//  HotProspects
//
//  Created by Endre Imecs on 8/28/24.
//

import SwiftUI

struct EditView: View {
    var prospect: Prospect
    
    @State private var name = ""
    @State private var emailAddress = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField(prospect.name, text: $name)
                    .onSubmit {
                        prospect.name = name
                    }
                TextField(prospect.emailAddress, text: $emailAddress)
                    .onSubmit {
                        prospect.emailAddress = emailAddress
                    }
            }
            .navigationTitle("Edit Contact")
        }
    }
}

#Preview {
    EditView(prospect: Prospect(name: "Endre Imecs", emailAddress: "endreimecs@ymail.com", isContacted: true))
}
