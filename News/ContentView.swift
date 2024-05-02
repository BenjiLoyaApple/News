//
//  ContentView.swift
//  News
//
//  Created by Benji Loya on 22.03.2024.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting


struct ContentView: View {
    
    @Environment(\.router) var router
    
    var body: some View {
        List {
            Button("Spotify") {
                router.showScreen(.fullScreenCover) { router in
                    SpotifyHomeView(vm: HomeViewModel(router: router))
                }
            }
            
            Button("Bumble") {
                router.showScreen(.fullScreenCover) { router in
                    BumbleHomeView()
                }
            }
            
            Button("Netflix") {
                router.showScreen(.fullScreenCover) { router in
                    NetflixHomeView()
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
