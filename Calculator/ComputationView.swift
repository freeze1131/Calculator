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
        Text(currentComputation)
        Text(mainResult)
    }
}

#Preview {
    ComputationView(mainResult: "6", currentComputation: "3+3")
}
