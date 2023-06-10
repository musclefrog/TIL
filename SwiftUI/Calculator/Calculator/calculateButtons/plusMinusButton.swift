//
//  plusMinusButton.swift
//  Calculator
//
//  Created by 김수인 on 2023/06/10.
//

import SwiftUI

struct plusMinusButton: View {
    var body: some View {
        Button(action: {
            print("+/- button")
        }) {
            Text("+/-")
                .frame(width: 75, height: 75)
                .foregroundColor(Color.black)
                .background(Color(red: 165 / 255, green: 165 / 255, blue: 165 / 255))
                .clipShape(Circle())
                .font(.system(size: 34))
        }
    }
}

struct plusMinusButton_Previews: PreviewProvider {
    static var previews: some View {
        plusMinusButton()
    }
}
