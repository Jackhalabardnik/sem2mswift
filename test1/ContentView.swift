//
//  ContentView.swift
//  test1
//
//  Created by Jacek  on 09/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var calculatedText: String = ""
    @State var operationToDo: (Double, Double) -> Double? = Calculator.add
    @State var numberAdded: Bool = false
    @State var calculated: Bool = false
    @State var firstNum: Double = 0
    @State var secondNum: Double = 0
    
    func add_decimal_number(base: Double,num: Double ) -> Double{
        return base * 10 + num
    }
    
    func add_number(str: String, num: Double) {
        if(calculated) {
            calculated = false
            calculatedText = ""
        }
        calculatedText.append(str)
        if(numberAdded) {
            secondNum = add_decimal_number(base: secondNum, num: num)
        } else {
            firstNum = add_decimal_number(base: firstNum, num: num)
        }
        
    }
    
    var body: some View {
        VStack {
            Text(calculatedText)
                .font(.title)
                .frame(width: 315, height: 60)
                .border(Color.black, width: 2)
            HStack {
                CButton(buttonText: "7", buttonAction: {
                    add_number(str: "7", num: 7)
                })
                CButton(buttonText: "8", buttonAction: {
                    add_number(str: "8", num: 8)
                })
                CButton(buttonText: "9", buttonAction: {
                    add_number(str: "9", num: 9)
                })
            }
            HStack {
                CButton(buttonText: "4", buttonAction: {
                    add_number(str: "4", num: 4)
                })
                CButton(buttonText: "5", buttonAction: {
                    add_number(str: "5", num: 5)
                })
                CButton(buttonText: "6", buttonAction: {
                    add_number(str: "6", num: 6)
                })
            }
            HStack {
                CButton(buttonText: "1", buttonAction: {
                    add_number(str: "1", num: 1)
                })
                CButton(buttonText: "2", buttonAction: {
                    add_number(str: "2", num: 2)
                })
                CButton(buttonText: "3", buttonAction: {
                    add_number(str: "3", num: 3)
                })
            }
            HStack {
                CButton(buttonText: "0", buttonAction: {
                    add_number(str: "0", num: 0)
                })
                CButton(buttonText: "+", buttonAction: {
                    numberAdded = true
                    calculatedText = ""
                    operationToDo = Calculator.add
                })
                CButton(buttonText: "-", buttonAction: {
                    numberAdded = true
                    calculatedText = ""
                    operationToDo = Calculator.substract
                })
            }
            HStack {
                CButton(buttonText: "*", buttonAction: {
                    numberAdded = true
                    calculatedText = ""
                    operationToDo = Calculator.mul
                })
                CButton(buttonText: "/", buttonAction: {
                    numberAdded = true
                    calculatedText = ""
                    operationToDo = Calculator.div
                })
                CButton(buttonText: "sin", buttonAction: {
                    numberAdded = true
                    calculatedText = ""
                    operationToDo = {(a: Double, _b: Double) -> Double? in
                        return Calculator.sinus(lhs: a)
                    }
                })
            }
            Button("Oblicz", action: {
                calculatedText = String(format: "%.1f", operationToDo(firstNum, secondNum)!)
                firstNum = 0
                secondNum = 0
                numberAdded = false
                calculated = true
            })
                .font(.title)
                .padding(15)
                .frame(width: 315, height: 60)
                .border(.black, width: 2)
            
        }
        .padding()
    }
}
