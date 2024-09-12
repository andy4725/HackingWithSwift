//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Endre Imecs on 9/4/24.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        let minY = proxy.frame(in: .global).minY
   
                        let hue = min(1, max(0, (minY / fullView.size.height)))
                        let scale = max(0.5, (minY / fullView.size.height))
                        let opacity = Double(min((minY - 50) / 200, 1))
                        
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: hue, saturation: 1, brightness: 1))
                            .opacity(opacity)
                            .scaleEffect(scale)
                            .rotation3DEffect(.degrees(minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
