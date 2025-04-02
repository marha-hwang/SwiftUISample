//
//  Stack.swift
//  SwiftUISample
//
//  Created by haram on 4/1/25.
//

import Foundation
import SwiftUI

struct StackView:View {
    
    var body: some View {
        HStack{
            Rectangle()
                .stroke(Color.primary)
                .frame(width: 50, height: 50)
                .offset(x: 0, y: 100)
        }
        .frame(width: 300, height: 300)
        .background(Color.gray)
    }
}

#Preview {
    StackView()
}
