//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Endre Imecs on 6/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Gryffindor")
                .blur(radius: 0)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .blur(radius: 5)
    }
}

#Preview {
    ContentView()
}
