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
        HStack(spacing: 15) {
            Image(systemName: "sun.max")
                .imageScale(.large)
                .foregroundStyle(lightMode ? sunOrMoonSelected : sunOrMoonNotSelected)
            Image(systemName: "moon")
                .imageScale(.large)
                .foregroundStyle(lightMode ? sunOrMoonNotSelected : sunOrMoonSelected)
        }
        .padding()
        .background(secondaryBackgroundColor)
        .clipShape(Capsule())
       
    }
}

#Preview {
    VStack{
        SunMoonView(lightMode: true)
        SunMoonView(lightMode: false)
    }
}
