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
    @State var mainResult: String = ""
    
    var body: some View {
        ZStack {
            primaryBackgroundColor.ignoresSafeArea()
            
            VStack {
                SunMoonView(lightMode: lightMode)
                    .onTapGesture {
                        withAnimation {
                            lightMode.toggle()
                        }
                        
                    }
                Spacer()
                // TODO: Change constant paramaters with dynamic ones
                ComputationView(mainResult: "8",currentComputation: "3+3")
                
                Spacer()
                
                ButtonsView(mainResult: $mainResult,currentComputation: $currentComputation)
            }
            .padding()
        }
    }
}

#Preview {
    CalculatorView()
}
