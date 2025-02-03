//
//  ContentView.swift
//  SwiftUISample
//
//  Created by haram on 1/3/25.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        NavigationView{
            List{
                Section(header: Text("타앱 디자인 모음")){
                    NavigationLink("쿠팡이츠 음식점 상세화면", destination: CoupangEatsDetail())
                }
                Section(header:Text("뷰 컴포넌트 모음")){
                    NavigationLink("자동 스크롤뷰", destination: AutoScrollView())
                    NavigationLink("무한배너", destination:
                                    InfiniteBanner(items: ["food1", "food2", "food3"]))
                    NavigationLink("줌 스크롤", destination: ScrollZoom())
                    NavigationLink("StickyHeader", destination: StickyHeader())
                }
                Section(header:Text("코드 샘플 모음")){
                    NavigationLink("@Stat @Binding", destination: AutoScrollView())
                }
            }
            .navigationTitle("SwiftUI Sample")
        }
        
    }

}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
