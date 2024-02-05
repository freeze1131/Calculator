//
//  ButtonsView.swift
//  Calculator
//
//  Created by Ahmet Ozen on 5.02.2024.
//

import SwiftUI

struct ButtonsView: View {
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    ButtonsView(currentComputation: .constant("QWE"), mainResult: .constant("SDFa"))
}
