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
    @State private var imageHeight: CGFloat = 300  // 초기 이미지 높이
    
    var body: some View {
        ScrollView{
            ZStack(alignment:.bottomTrailing){
                InfiniteBanner(items: ["food1", "food2", "food3"])
                    .frame(height:imageHeight) //프로퍼티의 값이 변화하면 뷰가 자동으로 변화함
                    .background( //geometry을 추가하면 view에 영향을 주기 때문에 background속성에서 추가하였음
                        GeometryReader{ geo in
                            Color.clear
                                .onChange(of: geo.frame(in: .global).minY) { minY in
                                    print("현재 Y값\(minY)")
                                    imageHeight = imageHeight + minY
                                }
                        }
                        
                    )
                
                CircleImage()
                    .offset(CGSize(width: -10, height: -10))
            }
            Text("Detail View")
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
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
