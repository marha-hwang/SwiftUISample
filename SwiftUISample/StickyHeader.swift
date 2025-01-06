//
//  StickyHeader.swift
//  SwiftUISample
//
//  Created by haram on 1/6/25.
//

import Foundation
import SwiftUI

struct StickyHeader:View {
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                ZStack{
                    Image("food1")
                        .resizable()
                        .frame(height: 300)
                    VStack{
                        Text("엽기떡볶이")
                        Text("4.9(3.093)")
                        Text("쿠폰 + 즉시할인")
                    }
                    .frame(width: UIScreen.main.bounds.width-50, height:100)
                    .background(Color.white)
                    .border(Color.black)
                    .offset(y:150)
                }
                .frame(height: 350, alignment: .topLeading)
                Spacer(minLength: 10)
                VStack{
                    HStack{
                        Text("도착까지 약 24분")
                            .offset(x:10)
                        Spacer()
                        Text("매장 원산지 정보")
                            .offset(x:-10)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    HStack{
                        Text("최소주문")
                            .offset(x:10)
                            .frame(width:80,alignment: .leading)
                        Text("11900원")
                    }
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    HStack{
                        Text("배달비")
                            .offset(x:10)
                            .frame(width:80, alignment: .leading)
                        Text("매 주문 무료배달")
                    }
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    
                }
                .border(Color.black)
                Spacer(minLength: 10)
                
                Section(header: Header()){
                    VStack{
                        Text("ContentArea")
                    }
                    .frame(width: UIScreen.main.bounds.width, height:1000)
                    .background(Color.gray)
                }
            }
        }
    }
}

struct Header:View {
    var body: some View {
        VStack{
            Text("Header")
        }
        .frame(width: UIScreen.main.bounds.width,height:50)
        .background(Color.yellow)
    }
}

#Preview {
    StickyHeader().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
