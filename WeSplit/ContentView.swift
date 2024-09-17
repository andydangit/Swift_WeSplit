//
//  ContentView.swift
//  WeSplit
//
//  Created by Andy Dang It on 9/17/24.
//

import SwiftUI

struct ContentView: View {
    let students = ["Andy", "Sandy", "Mandy"]
    
    @State private var selectedStudent = "Andy"
    
    var body: some View {
        
        NavigationStack{
            
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
                
            }
            .navigationTitle("Select a Student")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
