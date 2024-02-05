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
        CalcButtonModel(calcButton: .subtract,color: foregroundRightButtonColor),
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
                            buttonPressed(calcButton: item.calcButton)
                        }, label: {
                            SingleButtonView(calcButton: item.calcButton, fgColor: item.color, bgColor: buttonBackgroundColor)
                        })
                    }
                }
            }
        }
        .padding()
     
        
    }
    func buttonPressed(calcButton: CalcButton) {
        switch calcButton {
        case .clear:
            currentComputation = ""
            mainResult = "0"
            print("clear")
        case .add,.subtract,.divide,.multiply:
            print("operations")
            if lastCharIsDigitOrPercent(str:currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
           
        case .equal,.negative:
            if !currentComputation.isEmpty {
                if !lastChatIsAnOperator(str:currentComputation){
                    let sign = calcButton == .negative ? -1 : 1.0
                    
                    mainResult = formatResult(val: sign * calculateResults())
                    
                    if calcButton == .negative {
                        currentComputation = mainResult
                    }
                }
            }
            
            
            print("eq, negative")
        case .decimal:
            print("decimal")
        case .undo:
            currentComputation = String(currentComputation.dropLast())
            print("undo")
        case .percent:
            if lastCharIsDigit(str: currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
            print("percent")
        default:
            print("digits")
           appendToCurrentComputation(calcButton: calcButton)
        }
    }
    
    
    // Implements the actual calculation
    func calculateResults() -> Double {
        let visibleWorkings: String = currentComputation
        var workings = visibleWorkings.replacingOccurrences(of: "%", with: "*0.01")
        workings = workings.replacingOccurrences(of: multiplySymbol, with: "*")
        workings = workings.replacingOccurrences(of: divisonSymbol, with: "/")
        
        
        // If we have "35." this will be replaced by "35.0"
        if getLastChar(str: visibleWorkings) == "." {
            workings += "0"
        }
        
        // Key point!
        // Actual computations
        
        let expr = NSExpression(format: workings)
        let exprValue = expr.expressionValue(with: nil, context: nil) as! Double
        
        return exprValue
        
        
        
        
        
        
        
    }
    
    
    func appendToCurrentComputation(calcButton:CalcButton) {
        currentComputation += calcButton.rawValue
    }
}

#Preview {
    ButtonsView(currentComputation: .constant("QWE"), mainResult: .constant("SDFa"))
}
