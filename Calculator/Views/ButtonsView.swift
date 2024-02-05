//
//  ButtonsView.swift
//  Calculator
//
//  Created by Ahmet Ozen on 5.02.2024.
//

import SwiftUI

struct CalcButtonModel: Identifiable {
    let id = UUID()
    let calcButton: CalcButton
    var color: Color = foregroundDigitColor
    
}


struct RowOfCalcButtonsModel: Identifiable {
    let id = UUID()
    let row: [CalcButtonModel]
}

struct ButtonsView: View {
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    let buttonData: [RowOfCalcButtonsModel] = [
    RowOfCalcButtonsModel(row: [
        CalcButtonModel(calcButton: .clear,color: foregroundTopButtonColor),
        CalcButtonModel(calcButton: .percent,color: foregroundTopButtonColor),
        CalcButtonModel(calcButton: .negative,color: foregroundTopButtonColor),
        CalcButtonModel(calcButton: .divide,color:foregroundRightButtonColor),
    ]),
    
    RowOfCalcButtonsModel(row: [
        CalcButtonModel(calcButton: .seven),
        CalcButtonModel(calcButton: .eight),
        CalcButtonModel(calcButton: .nine),
        CalcButtonModel(calcButton: .multiply,color: foregroundRightButtonColor),
    ]),
    RowOfCalcButtonsModel(row: [
        CalcButtonModel(calcButton: .four),
        CalcButtonModel(calcButton: .five),
        CalcButtonModel(calcButton: .six),
        CalcButtonModel(calcButton: .divide,color: foregroundRightButtonColor),
    ]),
    RowOfCalcButtonsModel(row: [
        CalcButtonModel(calcButton: .one),
        CalcButtonModel(calcButton: .two),
        CalcButtonModel(calcButton: .three),
        CalcButtonModel(calcButton: .add,color: foregroundRightButtonColor),
    ]),
    RowOfCalcButtonsModel(row: [
        CalcButtonModel(calcButton: .undo),
        CalcButtonModel(calcButton: .zero),
        CalcButtonModel(calcButton: .decimal),
        CalcButtonModel(calcButton: .equal,color: foregroundRightButtonColor),
    ])
    
    
    ]
    
    var body: some View {
        Grid(){
            ForEach(buttonData){ rowOfCalcButtonsModel in
                GridRow {
                    ForEach(rowOfCalcButtonsModel.row) { item in
                        Button(action: {
                            // TODO: logic will be here
                            print("Button pressed")
                        }, label: {
                            SingleButtonView(calcButton: item.calcButton, fgColor: item.color, bgColor: buttonBackgroundColor)
                        })
                    }
                }
            }
        }
        .padding()
     
        
    }
}

#Preview {
    ButtonsView(currentComputation: .constant("QWE"), mainResult: .constant("SDFa"))
}
