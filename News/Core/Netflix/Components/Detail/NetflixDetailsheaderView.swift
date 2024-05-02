//
//  NetflixDetailsheaderView.swift
//  News
//
//  Created by Benji Loya on 02.05.2024.
//

import SwiftUI
import SwiftfulUI

struct NetflixDetailsheaderView: View {
    
    var imageName: String = Constants.randomImage
    var progress: Double = 0.2
    var onAirPlaypressed: (() -> Void)? = nil
    var onXMarkPressed: (() -> Void)? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
            
            CustomProgressBar(
                selection: progress,
                range: 0...1,
                backgroundColor: .netflixLightGray,
                foregroundColor: .netflixRed,
                cornerRadius: 2,
                height: 4
            )
            .padding(.bottom, 4)
            .animation(.linear, value: progress)
            
            HStack(spacing: 8) {
                Circle()
                    .fill(.netflixDarkGray)
                    .overlay (
                    Image(systemName: "tv.badge.wifi")
                        .offset(y: 1)
                    )
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        onAirPlaypressed?()
                    }
                
                Circle()
                    .fill(.netflixDarkGray)
                    .overlay (
                    Image(systemName: "xmark")
                    )
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        onXMarkPressed?()
                    }
            }
            .foregroundStyle(.netflixWhite)
            .font(.subheadline)
            .fontWeight(.bold)
            .padding(8)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
        .aspectRatio(2, contentMode: .fit)
    }
}

#Preview {
    NetflixDetailsheaderView()
}
