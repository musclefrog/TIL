//
//  ContentView.swift
//  Calculator
//
//  Created by 김수인 on 2023/06/10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var calculateNumber: String = "0"
    
    private let numberButton: [[String]] = [
        ["7", "8", "9"],
        ["4", "5", "6"],
        ["1", "2", "3"]]
    
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
                HStack {
                    Button {
                        calculateNumber = "0"
                    } label: {
                        Text("AC")
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(.gray)
                            .cornerRadius(40)
                            .font(.system(size: 33))
                    }
                    
                    Button {
                        if (calculateNumber.contains("-")) {
                            
                        }
                        else {
                            calculateNumber = "-" + calculateNumber
                        }
                        
                    } label: {
                        Image(systemName: "plus.forwardslash.minus")
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(.gray)
                            .cornerRadius(40)
                            .font(.system(size: 33))
                    }
                    
                    Button {
                        
                    } label: {
                        Text("%")
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .background(.gray)
                            .cornerRadius(40)
                            .font(.system(size: 33))
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "divide")
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(.orange)
                            .cornerRadius(40)
                            .font(.system(size: 33))
                    }
                    
                }
                HStack {
                    ForEach(numberButton[0], id: \.self) { row in
                        Button {
                            if (calculateNumber == "0") {
                                calculateNumber = row
                            }
                            else if (calculateNumber == "-0") {
                                calculateNumber = "-" + row
                            }
                            else {
                                calculateNumber += row
                            }

                        } label: {
                            Text(row)
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white)
                                .background(Color("NumberColor"))
                                .cornerRadius(40)
                                .font(.system(size: 33))
                        }
                    }
                    Button {

                    } label: {
                        Image(systemName: "multiply")
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(.orange)
                            .cornerRadius(40)
                            .font(.system(size: 33))
                    }
                }
                
                HStack {
                    ForEach(numberButton[1], id: \.self) { row in
                        Button {
                            if (calculateNumber == "0") {
                                calculateNumber = row
                            }
                            else if (calculateNumber == "-0") {
                                calculateNumber = "-" + row
                            }
                            else {
                                calculateNumber += row
                            }

                        } label: {
                            Text(row)
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white)
                                .background(Color("NumberColor"))
                                .cornerRadius(40)
                                .font(.system(size: 33))
                        }
                    }
                    Button {

                    } label: {
                        Image(systemName: "minus")
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(.orange)
                            .cornerRadius(40)
                            .font(.system(size: 33))
                    }
                }
                
                HStack {
                    ForEach(numberButton[2], id: \.self) { row in
                        Button {
                            if (calculateNumber == "0") {
                                calculateNumber = row
                            }
                            else if (calculateNumber == "-0") {
                                calculateNumber = "-" + row
                            }
                            else {
                                calculateNumber += row
                            }

                        } label: {
                            Text(row)
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white)
                                .background(Color("NumberColor"))
                                .cornerRadius(40)
                                .font(.system(size: 33))
                        }
                    }
                    Button {

                    } label: {
                        Image(systemName: "plus")
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(.orange)
                            .cornerRadius(40)
                            .font(.system(size: 33))
                    }
                }
                
                HStack {
                    Button {
                        if (calculateNumber == "0") {
                            calculateNumber = "0"
                        }
                        else {
                            calculateNumber += "0"
                        }
                    } label: {
                        Text("0")
                            .frame(width: 168, height: 80)
                            .foregroundColor(.white)
                            .background(Color("NumberColor"))
                            .cornerRadius(40)
                            .font(.system(size: 33))
                    }
                    
                    Button {
                        if (calculateNumber.contains(".")) {
                            
                        }
                        else {
                            calculateNumber += "."
                        }
                    } label: {
                        Text(".")
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(Color("NumberColor"))
                            .cornerRadius(40)
                            .font(.system(size: 33))
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "equal")
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(.orange)
                            .cornerRadius(40)
                            .font(.system(size: 33))
                    }
                }
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
