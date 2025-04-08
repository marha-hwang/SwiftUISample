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
            Color.red
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    StackView()
}
