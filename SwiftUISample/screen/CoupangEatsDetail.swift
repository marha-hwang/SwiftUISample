//
//  NavigationBarCustom.swift
//  SwiftUISample
//
//  Created by haram on 1/3/25.
//

import Foundation
import SwiftUI

//쿠팡이츠 음식점 상세화면
//네비게이션 영역을 이미지가 차지하도록
//일정시간이 지난 이후 카드뷰가 넘어가도록-자동슬라이드
//네비게이션바 커스텀
//일정 영역이상 스크롤 하는 경우 특정 위치로 이동하도록
//일정 영역이상 스크롤 하는 경우 네비게이션에 제목 표시
//가로스크롤뷰는 고정되고-Sticky Header, 특정 위치에 화면이 위치하는 경우 가로 스크롤뷰가 이동되도록

struct CoupangEatsDetail: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State var imageHeight: CGFloat = 300 // 이미지 초기 높이
    @State private var imageY:CGFloat = 300/2 //이미지 y좌표
    
    var body: some View {
        ScrollView{
            GeometryReader{ geo in
                VStack{
                    Text("aaa")
                        .background(Color.white)
                }
                .position(x:UIScreen.main.bounds.midX, y:300+10)
                .onChange(of: geo.frame(in: .global).minY){ minY in
                    if minY >= 0 {
                        imageHeight = 300+minY
                        imageY = imageHeight/2
                    }
                    else{
                        imageY = 150+minY
                    }
                    
                }

            }
            .frame(width:UIScreen.main.bounds.width, height: 1500)
        }
        .background(Color.gray)
        .overlay{
            ZStack(alignment:.bottomTrailing){
                InfiniteBanner(height: $imageHeight, items: ["food1", "food2", "food3"])
                    .background(Color.black)
                CircleImage()
                    .offset(CGSize(width: -10, height: -10))
            }
            .frame(height:imageHeight)
            .position(x:UIScreen.main.bounds.midX, y:imageY)
        }

        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)  // 기본 뒤로가기 버튼 숨기기
        .toolbar {
            // 커스텀 뒤로가기 버튼 추가
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image("back")  // 커스텀 이미지
                        .resizable()
                        .frame(width: 24, height: 24)  // 크기 조정
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    print("search")
                }) {
                    Image("search")  // 커스텀 이미지
                        .resizable()
                        .frame(width: 24, height: 24)  // 크기 조정
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    print("share")
                }) {
                    Image("share")  // 커스텀 이미지
                        .resizable()
                        .frame(width: 24, height: 24)  // 크기 조정
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    print("love")
                }) {
                    Image("love")  // 커스텀 이미지
                        .resizable()
                        .frame(width: 24, height: 24)  // 크기 조정
                }
            }
        }
    }
}

struct CircleImage:View{
    var body:some View{
        ZStack{
            Circle()
                .fill(.white)
                .frame(width: 30, height: 30)
            Image("photo")  // 커스텀 이미지
                .resizable()
                .frame(width: 20, height: 20)  // 크기 조정
        }
    }
}

#Preview {
    CoupangEatsDetail()
}
