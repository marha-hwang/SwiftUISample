//
//  SoopLogin.swift
//  SwiftUISample
//
//  Created by haram on 4/7/25.
//

import Foundation
import SwiftUI
struct SoopLogin:View {
    @State private var isPresented = true
    
    var body: some View {
        Button{
            self.isPresented.toggle()
        } label: {
            Text("로그인")
        }
        .fullScreenCover(isPresented: $isPresented) {
            LoginView(isPresented: $isPresented)
        }
    }
}
    
struct LoginView: View {
    @Binding var isPresented:Bool
    @State private var inputText: String = ""  // 입력된 텍스트를 저장할 상태 변수

    var body: some View {
        VStack(alignment:.center) {
            Button(action: {
                self.isPresented.toggle()
            }) {
                Spacer()
                Image(systemName: "xmark")  // X 표시
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)  // 빨간색으로 설정
                    .padding(EdgeInsets(top:20, leading: 30, bottom: 0, trailing: 30))
            }
            Spacer().frame(height: 40)
            
            // 중앙에 배치될 로그인박스
            VStack{
                Image("soop_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100)
                
                Spacer().frame(height: 10)
                    
                Text("로그인 후 더 많은 서비스를 즐겨보세요.")
                    .font(.system(size:15))
                    .foregroundColor(.white)
                
                Spacer().frame(height: 25)
                
                HStack{
                    Spacer().frame(width: 30)
                    HStack{
                        TextField("아이디", text: $inputText)  // 텍스트 필드
                            .background(Color.black)
                            .foregroundStyle(Color.white)
                    }
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 0))
                    .background(Color.black).brightness(0.10).cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    Spacer().frame(width: 30)
                    
                }
                
                Spacer().frame(height: 25)
                
                HStack{
                    Spacer().frame(width: 30)
                    HStack{
                        TextField("비밀번호", text: $inputText)  // 텍스트 필드
                            .background(Color.black)
                            .foregroundStyle(Color.white)
                    }
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 0))
                    .background(Color.black).brightness(0.10).cornerRadius(10)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 12)
//                            .stroke(Color.blue, lineWidth: 2)
//                    )
                    Spacer().frame(width: 30)
                    
                }
                
            }

            Spacer()
        }
        .background(Color(hex: "#0d1b2a").brightness(0.10))
        .ignoresSafeArea(.container, edges: [.bottom])
        .background(
            Color(hex: "#0d1b2a").brightness(0.10)
                .ignoresSafeArea()
        )
        
        
//        .opacity(0.5) // 50% 투명도
//        .brightness(0.2) // 밝기를 20% 증가
//        .saturation(0.5) // 채도를 50% 감소
//        .hueRotation(.degrees(90)) // 색조를 90도 회전
//        .shadow(color: .gray, radius: 5, x: -3, y: -3)
    }
}

#Preview {
    SoopLogin()
}


