//
//  SpotifyRecentCell.swift
//  News
//
//  Created by Benji Loya on 29.03.2024.
//

import SwiftUI

struct SpotifyRecentCell: View {
    
    var imageName: String = Constants.randomImage
    var title: String = "Random title"
    
    var body: some View {
        HStack(spacing: 16) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .lineLimit(2)
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColors(isSelected: false)
        .cornerRadius(6)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            HStack {
                SpotifyRecentCell()
                SpotifyRecentCell()

            }
            HStack {
                SpotifyRecentCell()
                SpotifyRecentCell()

            }
        }
    }
}
