//
//  PressedButton.swift
//  SwiftUISample
//
//  Created by haram on 4/23/25.
//

import Foundation
import SwiftUI
struct PressedButton:View{
    
    @State private var isPressed = false
    
    var body:some View{
        HStack{
            Spacer()
            Text("로그인")
                .font(.system(size:17))
                .foregroundColor(.white)
            Spacer()
        }
        .frame(height: 40)
        .background(
            Group{
                if isPressed{
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue)
                }
                else{
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray)
                }
            }
        )
        .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
        .onTapGesture {
//            isPressed = isPressed ? false:true
            print("onTapGesture")
        }
        .onLongPressGesture(
            minimumDuration: 0.1,
            perform: {
                isPressed = isPressed ? false:true
                print("onLongPressGesture perform")
            },
            onPressingChanged:{ _ in
                isPressed = isPressed ? false:true
                print("onLongPressGesture onPressingChanged")
            }
        )
//        .onLongPressGesture(minimumDuration: 0.1) {
//            isPressed = isPressed ? false:true
//            print("onLongPressGesture")
//        }
    }
}

#Preview{
    PressedButton()
}
