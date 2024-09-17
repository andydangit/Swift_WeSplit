//
//  ContentView.swift
//  WeSplit
//
//  Created by Andy Dang It on 9/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            Form {
                Section{
                    Text("Let's Split the check")
                }
                Section{
                    Text("Input the total amount")
                }
                Section{
                    Text("PlaceHolder")
                    Text("PlaceHolder")
                    Text("PlaceHolder")
                    
                }
            }
            .navigationTitle("SwiftUi")
            .navigationBarTitleDisplayMode(.inline)       
        }
    }
}

#Preview {
    ContentView()
}
