//
//  StateBinding.swift
//  SwiftUISample
//
//  Created by haram on 2/3/25.
//

import Foundation
import SwiftUI

struct StateBinding:View {
    
    @State private var count = 0
    
    var body: some View {
        
        BindingView(count: $count)
        
        Button("Add Value"){
            count += 1
            print(count)
        }
    }
}

struct BindingView:View {
    
    @Binding var count:Int
    
    var body: some View {
        Text(String(count))
    }
}

#Preview {
    StateBinding()
}
