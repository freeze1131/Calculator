//
//  ComputationView.swift
//  Calculator
//
//  Created by Ahmet Ozen on 5.02.2024.
//

import SwiftUI

struct ComputationView: View {
    
    let mainResult:String
    let currentComputation: String
    
    var body: some View {
        VStack (spacing:15){
            HStack {
                Spacer()
                Text(currentComputation)
                    .foregroundStyle(foregroundDigitColor)
                    .lineLimit(1)
                    .font(UIDevice.isIPad ? .largeTitle : .body)
            }
            .minimumScaleFactor(0.1)
            
            HStack {
                Spacer()
                Text(mainResult)
                    .foregroundStyle(foregroundDigitColor)
                    .fontWeight(.bold)
                .lineLimit(1)
                .font(UIDevice.isIPad ? .largeTitle : .body)
            }
            .minimumScaleFactor(0.1)
           
        }
        .padding(.horizontal)
    }
}

#Preview {
    ComputationView(mainResult: "6", currentComputation: "3+3")
}
