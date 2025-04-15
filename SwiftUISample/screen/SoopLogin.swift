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
    
    @FocusState private var isLogin:Bool
    @FocusState private var isPassword:Bool
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
                    .focused($isLogin)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    Spacer().frame(width: 30)
                    
                }
                
                Spacer().frame(height: 15)
                
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
                
                Spacer().frame(height:20)
                
                HStack{
                    Spacer()
                    Text("로그인")
                        .font(.system(size:17))
                        .foregroundColor(.white)
                    Spacer()
                }
                .frame(height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue)
                )
                .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
                
                Spacer().frame(height: 30)
                
                HStack{
                    Image("soop_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .background(
                            Circle().fill(Color.yellow).frame(width: 45, height: 45)
                        )
                    Spacer()
                    Image("soop_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .background(
                            Circle().fill(Color.yellow).frame(width: 45, height: 45)
                        )
                    Spacer()
                    Image("soop_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .background(
                            Circle().fill(Color.yellow).frame(width: 45, height: 45)
                        )
                    Spacer()
                    Image("soop_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .background(
                            Circle().fill(Color.yellow).frame(width: 45, height: 45)
                        )
                }
                .padding(EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 60))
                
                Spacer().frame(height: 40)
                
                HStack(spacing:10){
                    Text("아이디찾기").font(.system(size:12)).foregroundColor(.white)
                    Text("|").font(.system(size:12)).foregroundColor(.white)
                    Text("비밀번호찾기").font(.system(size:12)).foregroundColor(.white)
                    Text("|").font(.system(size:12)).foregroundColor(.white)
                    Text("회원가입").font(.system(size:12)).foregroundColor(.white)
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
        
    }
}

#Preview {
    SoopLogin()
}


