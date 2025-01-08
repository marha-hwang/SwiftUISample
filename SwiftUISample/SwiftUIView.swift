//
//  SwiftUIView.swift
//  SwiftUISample
//
//  Created by haram on 1/7/25.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Text("[치킨콤보] 우리모두 즐겁게 먹어요")
            .font(.custom("Helvetica Neue", size: 20))
            .fontWeight(.bold)
            .foregroundColor(.red)
            .kerning(23)
            .lineSpacing(30)
            .multilineTextAlignment(.center)
            .shadow(color: .black, radius: 5, x: 3, y: 3)
            .frame(width:UIScreen.main.bounds.width, height: 300, alignment: .top)
            .background(Color.green)
    }
}

#Preview {
    SwiftUIView()
}
