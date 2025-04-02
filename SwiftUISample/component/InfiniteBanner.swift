//
//  InfiniteBanner.swift
//  SwiftUISample
//
//  Created by haram on 1/4/25.
//

import Foundation
import SwiftUI

struct InfiniteBanner:View{
    @Binding var height:CGFloat
    
    var items:[String]
    @State var currentTab = 0
    @State var previousIndex = 0
    @State var currentIndex = 0
    @State var nextIndex = 0
    
    
    var body: some View{
        ZStack(alignment:.bottomLeading){
            TabView(selection:$currentTab){ //selection에 현재뷰의 태그값이 할당된다.
                Image(items[previousIndex])
                    .resizable()
                    .tag(-1)
                Image(items[currentIndex])
                    .resizable()
                    .tag(0)
                    .onDisappear{
                        previousIndex = currentIndex
                        currentIndex = nextIndex
                        nextIndex = nextIndex+1 >= items.count ? 0:nextIndex+1
                        currentTab = 0
                        print("disappear")
                    }
                Image(items[nextIndex])
                    .resizable()
                    .tag(1)
            }
            .onAppear{
                previousIndex = items.count-1
                nextIndex = 1
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            Capsule()
                .offset(x:10, y:-10)
                .frame(width: 55, height: 15)
                .foregroundColor(.gray)
                .overlay(
                    Text("\(currentIndex+1)/\(items.count)")
                        .font(.system(size: 14))
                        .offset(x:10, y:-10)
                )
        }
        .frame(height:height)
    }
}

