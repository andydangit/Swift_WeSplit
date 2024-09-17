//
//  ContentView.swift
//  WeSplit
//
//  Created by Andy Dang It on 9/17/24.
//

import SwiftUI

struct ContentView: View {
   @State private var name = ""
    @State private var email = ""
    
    var body: some View {
        
        NavigationStack{
            
            Form {
                TextField ("Enter your name", text: $name)
                Text("Hello \(name)")
                
                Section{
                    TextField("Enter your email address", text: $email)
                }
            }
            .navigationTitle("Hello \(name)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
