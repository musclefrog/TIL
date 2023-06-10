//
//  zeroButton.swift
//  Calculator
//
//  Created by 김수인 on 2023/06/10.
//

import SwiftUI

struct zeroButton: View {
    var body: some View {
        Button(action: {
            print("0 Button")
        }) {
            Text("0")
                .frame(width: 150, height: 75)
                .foregroundColor(Color.white)
                .background(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
                .clipShape(Capsule())
                .font(.system(size: 34))
                .multilineTextAlignment(.leading)
                
        }
    }
}

struct zeroButton_Previews: PreviewProvider {
    static var previews: some View {
        zeroButton()
    }
}
