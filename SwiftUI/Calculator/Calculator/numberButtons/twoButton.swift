//
//  twoButton.swift
//  Calculator
//
//  Created by 김수인 on 2023/06/10.
//

import SwiftUI

struct twoButton: View {
    var body: some View {
        Button(action: {
            print("2 Button")
        }) {
            Text("2")
                .frame(width: 75, height: 75)
                .foregroundColor(Color.white)
                .background(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
                .clipShape(Circle())
                .font(.system(size: 34))
        }
    }
}

struct twoButton_Previews: PreviewProvider {
    static var previews: some View {
        twoButton()
    }
}
