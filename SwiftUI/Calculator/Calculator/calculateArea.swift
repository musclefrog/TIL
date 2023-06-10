//
//  calculateArea.swift
//  Calculator
//
//  Created by 김수인 on 2023/06/10.
//

import SwiftUI

struct calculateArea: View {
    var body: some View {
        HStack {
            Text("0")
                .frame(width: 350, height: 200, alignment: .trailing)
                .foregroundColor(.white)
            .font(.system(size: 100))
            .padding(.trailing, 30)
            .fontWeight(.light)
        }
                
    }
}

struct calculateArea_Previews: PreviewProvider {
    static var previews: some View {
        calculateArea()
    }
}
