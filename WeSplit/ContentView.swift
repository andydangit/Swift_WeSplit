//
//  ContentView.swift
//  WeSplit
//
//  Created by Andy Dang It on 9/17/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
