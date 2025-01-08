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
 scrollView Indicator커스텀 필요 https://luthviar.medium.com/swiftui-custom-scrollview-indicator-horizontally-7f4fe2e20bc9
 */
struct AutoScrollView: View {
    
    let menulist = ["인기메뉴", "[갓성비] 후라이드 콤보세트", "[한정판메] 큐브 스테이크 콤보세트", "[사이드] 음료 및 스낵"]
    
    var body: some View {
        VStack(spacing: 0){
            UnderLineScrollView(menulist:menulist){
                CustomText(text:"메뉴 선택")
            }

            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(Color.blue)
            
            ScrollView{
                
            }.background(Color.yellow)
        }
    }
    
    /*
     @ViewBuilder : View를 반환하는 클로저 앞에 @ViewBuilder을 붙힘으로써 해당 클로저는 뷰를 생성할 수 있게 된다.
         body 클로저 변수는 암시적으로 @ViewBuilder가 붙어있기 때문에 별도로 추가하지 않아도 뷰를 생성 할 수 있는 것!
     
     
     */
    struct UnderLineScrollView<Content:View>:View{
        private let content:()->Content
        private let menulist:[String]
        
        init(menulist:[String], @ViewBuilder content: @escaping () -> Content) {
            self.content = content
            self.menulist = menulist
        }
        
        var body: some View{
            ScrollViewReader{ proxy in
                content()
                ScrollView(.horizontal){
                    HStack{
                        var i = 0
                        ForEach(0..<menulist.count-1, id: \.self) { i in
                            CustomText(text: menulist[i])
                                .onTapGesture {
                                    proxy.scrollTo(i-1 < 0 ? 0:i-1, anchor: .leading)
                                }
                                .id(i)
                            if i != menulist.count-1 { Spacer(minLength: 30)}
                           
                        }
                    }
                }
            }
        }
        
    }
    
    struct CustomText:View{
        var text:String
        var body:some View{
            Text(text)
                .font(.custom("BMHANNAPro", size: 20))
        }
    }
        
}

#Preview {
    AutoScrollView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
