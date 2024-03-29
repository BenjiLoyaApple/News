//
//  HomeView.swift
//  News
//
//  Created by Benji Loya on 28.03.2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 5, pinnedViews: [.sectionHeaders], content: {
                    Section {
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .fill(Color.spotifyLightGray)
                                .frame(width: 200, height: 200)
                        }
                    } header: {
                        header
                    }
                })
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .clipped()
            
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            currentUser = try await DataBaseHelper().getUsers().first
       //     products = try await DataBaseHelper().getProducts()
        } catch {
            print("Error: \(error)")
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                }
            }
            .frame(width: 36, height: 36)
           
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(title: category.rawValue.capitalized, isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 14)
        .padding(.leading, 8)
        .frame(maxWidth: .infinity)
        .background(Color.spotifyBlack)
    }
    
}

#Preview {
    HomeView()
}
