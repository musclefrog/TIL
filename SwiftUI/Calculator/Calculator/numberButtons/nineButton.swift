//
//  nineButton.swift
//  Calculator
//
//  Created by 김수인 on 2023/06/10.
//

import SwiftUI

struct nineButton: View {
    var body: some View {
        Button(action: {
            print("9 Button")
        }) {
            Text("9")
                .frame(width: 75, height: 75)
                .foregroundColor(Color.white)
                .background(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
                .clipShape(Circle())
                .font(.system(size: 34))
        }
    }
}

struct nineButton_Previews: PreviewProvider {
    static var previews: some View {
        nineButton()
    }
}
