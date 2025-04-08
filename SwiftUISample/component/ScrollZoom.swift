//
//  ScrollZoom.swift
//  SwiftUISample
//
//  Created by haram on 1/5/25.
//

//
//  InfiniteBanner.swift
//  SwiftUISample
//
//  Created by haram on 1/4/25.
//

import Foundation
import SwiftUI

struct ScrollZoomView:View{
    
    @State private var imageHeight: CGFloat = 300 // 이미지 초기 높이
    @State private var imageY:CGFloat = 300/2 //이미지 y좌표
    
    
    var body: some View{
            ScrollView{
                GeometryReader{ geo in
                    VStack{
                        Image("food2")
                            .resizable()
                            .frame(height:imageHeight)
                            .position(x:UIScreen.main.bounds.midX, y:300/2)

                        Text("aaa")
                            .position(x:UIScreen.main.bounds.midX, y:imageY/2)
                    }
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
            .padding(.top, 0)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ScrollZoomView()
}
