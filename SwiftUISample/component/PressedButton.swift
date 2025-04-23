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
        
        GeometryReader{ geo in
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
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let frame = geo.frame(in: .global)
                        if !frame.contains(value.location) {
                            // 바깥으로 나갔을 때 이벤트 종료 처리
                            print("in")
                            isPressed = true
                        } else {
                            // 뷰 내부일 때만 드래그 상태 유지
                            print("out")
                            isPressed = false
                        }                    }
                    .onEnded { _ in
                        print("dragEnded")
                        isPressed = false
                    }
            )

            .onLongPressGesture(
                minimumDuration: 10,
                perform: {
                    print("onLongPressGesture perform")
                },
                onPressingChanged:{ value in
                    isPressed = value
                    print("onLongPressGesture \(value)")
                }
            )
        }
        
        
    }
}

#Preview{
    PressedButton()
}
