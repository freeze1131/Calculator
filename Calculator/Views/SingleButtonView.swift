//
//  SingleButtonView.swift
//  Calculator
//
//  Created by Ahmet Ozen on 5.02.2024.
//

import SwiftUI


extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
}

struct SingleButtonView: View {
    let calcButton: CalcButton
    let fgColor: Color
    let bgColor: Color
    
    var systemImage: String? {
        let value = calcButton.rawValue
        return value.contains("IMG") ? value.replacingOccurrences(of: "IMG", with: "") : nil
    }
    
    
    var text: String? {
        let value = calcButton.rawValue
        return value.contains("IMG") ? nil : value
    }
    
    
    let buttonDimension: CGFloat = UIScreen.screenWidth / 5
    
    
    var body: some View {
        ZStack {
            Text(text ?? "")
            Image(systemName: systemImage ?? "")
        }
        .font(.title2)
        .fontWeight(.semibold)
        .frame(width: buttonDimension,height: buttonDimension)
        .foregroundStyle(fgColor)
        .background(bgColor)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 0)))
    }
}

#Preview {
    VStack{
        SingleButtonView(calcButton: .one, fgColor: foregroundDigitColor, bgColor:buttonBackgroundColor)
        SingleButtonView(calcButton: .add, fgColor: foregroubdRightButtonColor, bgColor:buttonBackgroundColor)
        SingleButtonView(calcButton: .undo, fgColor: foregroundTopButtonColor, bgColor:buttonBackgroundColor)
    }
}
