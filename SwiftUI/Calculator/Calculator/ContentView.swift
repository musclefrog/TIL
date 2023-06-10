//
//  ContentView.swift
//  Calculator
//
//  Created by 김수인 on 2023/06/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // 배경설정
            Color.black.ignoresSafeArea()
            
            VStack {
                calculateArea()
                HStack {
                    ACButton()
                    plusMinusButton()
                    percentButton()
                    divideButton()
                }
                HStack {
                    sevenButton()
                    eightButton()
                    nineButton()
                    multiplyButton()
                }
                HStack {
                    fourButton()
                    fiveButton()
                    sixButton()
                    minusButton()
                }
                HStack {
                    oneButton()
                    twoButton()
                    threeButton()
                    plusButton()
                }
                HStack {
                    zeroButton()
                    periodButton()
                    equalButton()
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
