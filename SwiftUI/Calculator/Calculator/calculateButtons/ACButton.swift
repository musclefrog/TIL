//
//  ACButton.swift
//  Calculator
//
//  Created by 김수인 on 2023/06/10.
//

import SwiftUI

struct ACButton: View {
    var body: some View {
        Button(action: {
            print("AC Button")
        }) {
            Text("AC")
                .frame(width: 75, height: 75)
                .foregroundColor(Color.black)
                .background(Color(red: 165 / 255, green: 165 / 255, blue: 165 / 255))
                .clipShape(Circle())
                .font(.system(size: 34))
        }
    }
}

struct ACButton_Previews: PreviewProvider {
    static var previews: some View {
        ACButton()
    }
}
