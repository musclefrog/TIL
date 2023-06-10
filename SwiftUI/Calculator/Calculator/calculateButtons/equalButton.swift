//
//  equalButton.swift
//  Calculator
//
//  Created by 김수인 on 2023/06/10.
//

import SwiftUI

struct equalButton: View {
    var body: some View {
        Button(action: {
            print("Equal Button")
        }) {
            Image(systemName: "equal")
                .frame(width: 75, height: 75)
                .foregroundColor(Color.white)
                .background(Color(red: 254 / 255, green: 159 / 255, blue: 6 / 255))
                .clipShape(Circle())
                .font(.system(size: 34))
        }
    }
}

struct equalButton_Previews: PreviewProvider {
    static var previews: some View {
        equalButton()
    }
}
