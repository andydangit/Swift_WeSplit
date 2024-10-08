//
//  ContentView.swift
//  WeSplit
//
//  Created by Andy Dang It on 9/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    @State private var redText = false
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalTipAmount: Double {
        let tipValue = checkAmount / 100 * Double(tipPercentage)
        
        return tipValue
    }
    
    var totalAmountWithTip: Double{
        let grandTotal = checkAmount + totalTipAmount
        
        return grandTotal
    }
    
    
    var totalPerPerson: Double {
        let peopleCount = Double (numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100 ) {
                            Text("\($0) people")
                        }
                    }
                    //                    This  allow the pickerstyler to move to another screen
                    //                     .pickerStyle(.navigationLink)
                }
                
                Section("Tip Amount"){
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent) 
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                
                Section {
                    
                    HStack{
                        Text("Total Tip:")
                        Spacer()
                        Text(totalTipAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD" ))
                        
                    }
                    HStack{
                        Text("Total Amount:")
                        Spacer()
                        Text(totalAmountWithTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD" ))
                            .foregroundColor(tipPercentage == 0 ? .red : .primary)
                        
                        
                    }
                    
                    HStack{
                        Text("Each Person Pay:")
                        Spacer()
                        Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD" ))
                    }
                }
                
                
            }
            .navigationTitle("Check Split")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
