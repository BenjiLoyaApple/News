//
//  ContentView.swift
//  News
//
//  Created by Benji Loya on 22.03.2024.
//

import SwiftUI
import SwiftfulRouting


struct ContentView: View {
    
    @Environment(\.router) var router
    
    var body: some View {
        List {
            Button("Open Spotify") {
                router.showScreen(.fullScreenCover) { router in
                    HomeView(vm: HomeViewModel(router: router))
                }
            }
            
        }
       // .listStyle(.plain)
    }
}

#Preview {
    RouterView { _ in
        ContentView()
    }
}
