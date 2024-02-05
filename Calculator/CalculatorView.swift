//
//  ContentView.swift
//  Calculator
//
//  Created by Ahmet Ozen on 4.02.2024.
//

import SwiftUI

struct CalculatorView: View {
    
    @State var lightMode: Bool = true
    @State var currentComputation: String = ""
   
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    CalculatorView()
}
