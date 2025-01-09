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

struct Menu:Identifiable{
    var id:String{ name }
    let name:String
    let price:String
    let description:String
    let imageUrl:String
}


struct AutoScrollView: View {
    
    let categoryList = ["인기메뉴", "양념치킨", "후라이드 치킨", "간장치킨", "파닭", "스페셜 치킨"]
    let menuList:[[Menu]] = [
        [Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
         Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
         Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
        ],
        [Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
         Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
         Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
         Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
        ],
        [Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
         Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
         Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
         Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
         Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
        ],
        [Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
         Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
        ],
        [Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
        ],
        [Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
         Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
         Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
         Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
         Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
         Menu(name:"딸기 말차 밀크티", price:"5300원", description:"[추천] Suger50% /Ice고정 /.딸기 + 얼그레이티 + 녹차몸이 더해진 시즌 이고 매우맛있는 음료수 입니다.", imageUrl: "food3"),
        ]
    ]
    
    var body: some View {
        VStack(spacing: 0){
            ScrollViewReader{ proxy in
                UnderLineScrollView(menulist:categoryList, proxy:proxy){
                    CustomText(text:"메뉴 선택")
                }
                
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(Color.blue)
                Spacer(minLength: 10)
                List{
                    ForEach(0..<categoryList.count, id: \.self) { i in
                        Section(header: Text(categoryList[i]).id(categoryList[i])){
                            ForEach(menuList[i], id: \.id) { menu in
                                MenuCardView(menu: menu, action: nil)
                                    .frame(height:100)
                            }
                        }
                    }
                }
            }
        }
    }
    
    /*
     @ViewBuilder : View를 반환하는 클로저 앞에 @ViewBuilder을 붙힘으로써 해당 클로저는 뷰를 생성할 수 있게 된다.
         body 클로저 변수는 암시적으로 @ViewBuilder가 붙어있기 때문에 별도로 추가하지 않아도 뷰를 생성 할 수 있는 것!
     
     
     */
    
        
}

struct UnderLineScrollView<Content:View>:View{
    private let content:()->Content
    private let menulist:[String]
    private let proxy:ScrollViewProxy
    
    init(menulist:[String], proxy:ScrollViewProxy, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.menulist = menulist
        self.proxy = proxy
    }
    
    var body: some View{
        ScrollViewReader{ proxy in
            content()
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<menulist.count-1, id: \.self) { i in
                        CustomText(text: menulist[i])
                            .onTapGesture {
                                withAnimation{
                                    proxy.scrollTo(i-1 < 0 ? 0:i-1, anchor: .leading)
                                    self.proxy.scrollTo(menulist[i], anchor: .top)
                                }
                            }
                            .id(i)
                        if i != menulist.count-1 { Spacer(minLength: 30)}
                       
                    }
                }
            }
        }
    }
    
}

struct MenuCardView:View{
    private let name:String
    private let price:String
    private let description:String
    private let imageUrl:String
    private let action:(()->Void)?
    
    init(menu:Menu, action:(()->Void)?) {
        self.name = menu.name
        self.price = menu.price
        self.description = menu.description
        self.imageUrl = menu.imageUrl
        self.action = action
    }
    
    var body: some View{
        HStack(spacing:20){
            VStack(spacing:10){
                Text(name)
                Text(price)
                Text(description)
            }
            Image(imageUrl)
                .resizable()
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

#Preview {
    AutoScrollView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
