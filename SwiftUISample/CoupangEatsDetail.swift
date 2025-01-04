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
            GeometryReader { geometry in
                let offset = geometry.frame(in: .global).minY
                
                AutoScrollView()
            
//                Image("food1")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: UIScreen.main.bounds.width, height: imageHeight + offset)
//                    .position(x: UIScreen.main.bounds.width/2, y: imageHeight/2-offset) //이미지의 중심축을 기준으로 배치되기 때문에 가로, 세로 절반의 크기를 고정값으로 주었음
            }
            .frame(height: imageHeight)  // 초기 높이 설정
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

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
