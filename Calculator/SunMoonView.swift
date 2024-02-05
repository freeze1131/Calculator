//
//  SunMoonView.swift
//  Calculator
//
//  Created by Ahmet Ozen on 5.02.2024.
//

import SwiftUI

struct SunMoonView: View {
    var lightMode: Bool
    var body: some View {
        Text("Hello \(lightMode ? "light" : "dark") ")
       
    }
}

#Preview {
    SunMoonView(lightMode: true)
}