//
//  ContentView.swift
//  mma20220623
//
//  Created by YASUSHI NOZAKI on R 4/06/23.
//

import SwiftUI

struct ContentView: View {
    @State var isRight = false

    var body: some View {
        Text(isRight ? "→" : "←")
            .padding()
        Button("Invert") {
            self.isRight = !self.isRight
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
