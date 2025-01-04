//
//  AutoScrollView.swift
//  SwiftUISample
//
//  Created by haram on 1/4/25.
//

import Foundation
import SwiftUI

/**
 컴포넌트 설명 : 상단에 탭버튼이 존재하고 사용자가 스크롤시 지정된 위치로 이동하는 컴포넌트
 컴포넌트 구조 :
 */
struct AutoScrollView: View {
    @State private var scrollOffset: CGFloat = 0
    @State private var scrollTimer: Timer? = nil
    @State private var isScrolling: Bool = false
    var imageArr = ["food1", "food2", "food3"]
    
    var body: some View {
        ScrollViewReader{ proxy in
                ScrollView(.horizontal){
                    GeometryReader{ geo in
                        HStack(spacing:0){
                            ForEach(imageArr, id: \.self) { image in
                                GeometryReader{geo in
                                    Image(image)
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width, height: 300)
                                        .scaledToFit()
                                        .id(image)
                                }
                            }
                        }
                        .onAppear {
                            // 초기 위치
                            print("스크롤 시작 위치: \(geo.frame(in: .global).minX)")
                        }
                        .onChange(of: geo.frame(in: .global).minX) { newMinX in
                            // 스크롤 이동 시마다 오프셋 업데이트
                            scrollOffset = -newMinX
                            startScrollDetection(proxy: proxy)
                            print("현재 스크롤 오프셋: \(scrollOffset)")
                        }
                }
                .frame(width: UIScreen.main.bounds.width*CGFloat(imageArr.count), height: 300)
            }
        }
    }
    
    // 스크롤 멈춤 감지 함수
    private func startScrollDetection(proxy:ScrollViewProxy) {
        // 이전 타이머가 존재하면 취소
        scrollTimer?.invalidate()
        
        // 새로운 타이머 설정
        scrollTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { _ in
            // 일정 시간 후 스크롤이 멈췄다고 간주
            withAnimation {
                isScrolling = false
            }
            
            var target = Int(scrollOffset / (UIScreen.main.bounds.width/2))
            if(target >= imageArr.count) {target = imageArr.count-1}
            proxy.scrollTo(imageArr[target])
            print("스크롤이 멈췄습니다.")
        }
        
        // 스크롤이 움직일 때마다 isScrolling을 true로 설정
        isScrolling = true
    }
}

#Preview {
    AutoScrollView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
