//
//  ContentView.swift
//  mma20220623
//
//  Created by YASUSHI NOZAKI on R 4/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var direction = 0.0

    var body: some View {
        Image((direction >= 0.5) ? "rightarrow" : "leftarrow")
            .padding()
        Slider(value: $direction,
               in: 0...1,
               onEditingChanged: { _ in
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
