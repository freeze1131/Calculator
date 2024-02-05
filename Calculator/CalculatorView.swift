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
                ComputationView(mainResult: mainResult,currentComputation: currentComputation)
                
                Spacer()
                
                ButtonsView(currentComputation: $currentComputation, mainResult: $mainResult)
            }
            .padding()
        }
        .environment(\.colorScheme,lightMode ? .light : .dark)
    }
        
}

#Preview {
    CalculatorView()
}
