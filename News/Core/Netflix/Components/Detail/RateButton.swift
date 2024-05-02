//
//  RateButton.swift
//  News
//
//  Created by Benji Loya on 02.05.2024.
//

import SwiftUI

enum RateOption: String, CaseIterable {
    case dislike, like, love
    
    var title: String {
        switch self {
        case .dislike:
            return "Not for me"
        case .like:
            return "I Like this"
        case .love:
            return "Love this"
        }
    }
    
    var iconName: String {
        switch self {
        case .dislike:
            return "hand.thumbsdown"
        case .like:
            return "hand.thumbsup"
        case .love:
            return "bolt.heart"
        }
    }
}

struct RateButton: View {
    
   @State private var showPopower: Bool = false
    var onRatingselected: ((RateOption) -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 8) {
                    Image(systemName: "hand.thumbsup")
            .font(.title)
            
            Text("Rate")
                .font(.caption)
                .foregroundStyle(.netflixLightGray)
            
        }
        .foregroundStyle(.netflixWhite)
        .padding(8)
        .background(Color.black.opacity(0.001))
        .onTapGesture {
            showPopower.toggle()
        }
        .popover(isPresented: $showPopower, content: {
            ZStack {
                Color.netflixDarkGray.ignoresSafeArea()
                
                HStack(spacing: 12) {
                    ForEach(RateOption.allCases, id: \.self) { option in
                        rateButton(option: option)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
            .presentationCompactAdaptation(.popover)
        })
    }
    
    private func rateButton(option: RateOption) -> some View {
        VStack(spacing: 8) {
            Image(systemName: option.iconName)
                .font(.title2)
            Text(option.title)
                .font(.caption)
        }
        .foregroundStyle(.netflixWhite)
        .padding(4)
        .background(Color.black.opacity(0.001))
        .onTapGesture {
            showPopower = false
            onRatingselected?(option)
        }
    }
    
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        RateButton()
    }
}
