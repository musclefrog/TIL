//
//  ContentView.swift
//  Calculator
//
//  Created by 김수인 on 2023/06/10.
//

import SwiftUI

enum ButtonType: String {
    case one, two, three, four, five, six, seven, eight, nine, zero
    case point, equal, plus, minus, multiply, divide
    case clear, opposite, percent
    
    var buttonName: String {
        switch self {
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .zero:
            return "0"
        case .point:
            return "."
        case .equal:
            return "="
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiply:
            return "X"
        case .divide:
            return "/"
        case .clear:
            return "AC"
        case .opposite:
            return "+/-"
        case .percent:
            return "%"
        }
    }
    var backgroundColor: Color {
        switch self {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .point:
            return Color("NumberColor")
        case .equal, .plus, .minus, .multiply, .divide:
            return Color.orange
        case .clear, .opposite, .percent:
            return Color.gray
        }
    }
    var foregroundColor: Color {
        switch self {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .point, .equal, .plus, .minus, .multiply, .divide:
            return Color.white
        case .clear, .opposite, .percent:
            return Color.black
        }
    }
}


struct ContentView: View {
    
    @State private var calculateNumber: String = "0"

    private let buttonName: [[ButtonType]] = [
        [.clear, .opposite, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .zero, .point, .equal]]
    
    var body: some View {
        ZStack {
            // 배경설정
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(calculateNumber)
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                        .padding(.trailing)
                }
                
                ForEach(buttonName, id: \.self) { i in
                    HStack {
                        ForEach(i, id: \.self) { row in
                            Button {
                                if calculateNumber == "0" {
                                    calculateNumber = "7"
                            }
                                else {
                                    calculateNumber += "7"
                                }

                            } label: {
                                Text(row.buttonName)
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(row.foregroundColor)
                                    .background(row.backgroundColor)
                                    .cornerRadius(40)
                                    .font(.system(size: 33))
                            }
                        }
                    }
                }
                
//                HStack {
//                    Button {
//                        calculateNumber = "0"
//                    } label: {
//                        Text("AC")
//                            .frame(width: 80, height: 80)
//                            .foregroundColor(.black)
//                            .background(.gray)
//                            .cornerRadius(40)
//                            .font(.system(size: 33))
//                    }
//
//                    Button {
//                        if (calculateNumber.contains("-")) {
//
//                        }
//                        else {
//                            calculateNumber = "-" + calculateNumber
//                        }
//
//                    } label: {
//                        Image(systemName: "plus.forwardslash.minus")
//                            .frame(width: 80, height: 80)
//                            .foregroundColor(.black)
//                            .background(.gray)
//                            .cornerRadius(40)
//                            .font(.system(size: 33))
//                    }
//
//                    Button {
//
//                    } label: {
//                        Text("%")
//                            .frame(width: 80, height: 80)
//                            .foregroundColor(.black)
//                            .background(.gray)
//                            .cornerRadius(40)
//                            .font(.system(size: 33))
//                    }
//
//                    Button {
//
//                    } label: {
//                        Image(systemName: "divide")
//                            .frame(width: 80, height: 80)
//                            .foregroundColor(.white)
//                            .background(.orange)
//                            .cornerRadius(40)
//                            .font(.system(size: 33))
//                    }
//
//                }
//
//                HStack {
//                    ForEach(numberButton[0], id: \.self) { row in
//                        Button {
//                            if (calculateNumber == "0") {
//                                calculateNumber = row
//                            }
//                            else if (calculateNumber == "-0") {
//                                calculateNumber = "-" + row
//                            }
//                            else {
//                                calculateNumber += row
//                            }
//
//                        } label: {
//                            Text(row)
//                                .frame(width: 80, height: 80)
//                                .foregroundColor(.white)
//                                .background(Color("NumberColor"))
//                                .cornerRadius(40)
//                                .font(.system(size: 33))
//                        }
//                    }
//                    Button {
//
//                    } label: {
//                        Image(systemName: "multiply")
//                            .frame(width: 80, height: 80)
//                            .foregroundColor(.white)
//                            .background(.orange)
//                            .cornerRadius(40)
//                            .font(.system(size: 33))
//                    }
//                }
//
//                HStack {
//                    ForEach(numberButton[1], id: \.self) { row in
//                        Button {
//                            if (calculateNumber == "0") {
//                                calculateNumber = row
//                            }
//                            else if (calculateNumber == "-0") {
//                                calculateNumber = "-" + row
//                            }
//                            else {
//                                calculateNumber += row
//                            }
//
//                        } label: {
//                            Text(row)
//                                .frame(width: 80, height: 80)
//                                .foregroundColor(.white)
//                                .background(Color("NumberColor"))
//                                .cornerRadius(40)
//                                .font(.system(size: 33))
//                        }
//                    }
//                    Button {
//
//                    } label: {
//                        Image(systemName: "minus")
//                            .frame(width: 80, height: 80)
//                            .foregroundColor(.white)
//                            .background(.orange)
//                            .cornerRadius(40)
//                            .font(.system(size: 33))
//                    }
//                }
//
//                HStack {
//                    ForEach(numberButton[2], id: \.self) { row in
//                        Button {
//                            if (calculateNumber == "0") {
//                                calculateNumber = row
//                            }
//                            else if (calculateNumber == "-0") {
//                                calculateNumber = "-" + row
//                            }
//                            else {
//                                calculateNumber += row
//                            }
//
//                        } label: {
//                            Text(row)
//                                .frame(width: 80, height: 80)
//                                .foregroundColor(.white)
//                                .background(Color("NumberColor"))
//                                .cornerRadius(40)
//                                .font(.system(size: 33))
//                        }
//                    }
//                    Button {
//
//                    } label: {
//                        Image(systemName: "plus")
//                            .frame(width: 80, height: 80)
//                            .foregroundColor(.white)
//                            .background(.orange)
//                            .cornerRadius(40)
//                            .font(.system(size: 33))
//                    }
//                }
//
//                HStack {
//                    Button {
//                        if (calculateNumber == "0") {
//                            calculateNumber = "0"
//                        }
//                        else {
//                            calculateNumber += "0"
//                        }
//                    } label: {
//                        Text("0")
//                            .frame(width: 168, height: 80)
//                            .foregroundColor(.white)
//                            .background(Color("NumberColor"))
//                            .cornerRadius(40)
//                            .font(.system(size: 33))
//                    }
//
//                    Button {
//                        if (calculateNumber.contains(".")) {
//
//                        }
//                        else {
//                            calculateNumber += "."
//                        }
//                    } label: {
//                        Text(".")
//                            .frame(width: 80, height: 80)
//                            .foregroundColor(.white)
//                            .background(Color("NumberColor"))
//                            .cornerRadius(40)
//                            .font(.system(size: 33))
//                    }
//
//                    Button {
//
//                    } label: {
//                        Image(systemName: "equal")
//                            .frame(width: 80, height: 80)
//                            .foregroundColor(.white)
//                            .background(.orange)
//                            .cornerRadius(40)
//                            .font(.system(size: 33))
//                    }
//                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
