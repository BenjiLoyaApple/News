//
//  NetflixMovieDetailsView.swift
//  News
//
//  Created by Benji Loya on 02.05.2024.
//

import SwiftUI

struct NetflixMovieDetailsView: View {
    
    @Environment(\.router) var router
    
    var product: Product = .mock
    
    @State private var progress: Double = 0.2
    @State private var isMyList: Bool = false
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 0) {
                NetflixDetailsheaderView(
                    imageName: product.firstImage,
                    progress: progress,
                    onAirPlaypressed: {
                        
                    },
                    onXMarkPressed: {
                        router.dismissScreen()
                    }
                )
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        detailProductSection
                        
                        buttonSection
                        
                        productsGridSection
                    }
                    .padding(8)
                }
                .scrollIndicators(.hidden)
            }
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    //MARK: -  detail Product Section
    private var detailProductSection: some View {
        NetflixDetailsProductView(
            title: product.title,
            isNew: true,
            yearReleased: "2024",
            seasonCount: 4,
            hasClosedCaptions: true,
            isTopTen: 6,
            descriptionText: product.description,
            castText: "Cast: Benji, Your Name",
            onPlayPressed: {
                
            },
            onDownloadPressed: {
                
            }
        )
    }
    
    private func onProductPressed(product: Product) {
        router.showScreen(.sheet) { _ in
            NetflixMovieDetailsView(product: product)
        }
    }
    
    //MARK: -  button Section
    private var buttonSection: some View {
        HStack(alignment: .bottom, spacing: 32) {
            MyListButton(isMyList: isMyList) {
                isMyList.toggle()
            }
            
            RateButton { selection in
                // do somithing with selection
            }
            
            ShareButton()
            
        }
        .padding(.leading, 32)
    }
    
    //MARK: -  products Grid Section
    private var productsGridSection: some View {
        VStack(alignment: .leading) {
            Text("More Like This")
                .font(.headline)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 8), count: 3),
                      alignment: .center,
                      spacing: 8,
                      pinnedViews: [],
                      content: {
                ForEach(products) { product in
                    NetflixMovieCell(
                        imageName: product.firstImage,
                        title: product.title,
                        isRecentlyAdded: product.recentlyAdded,
                        topTenRanking: nil
                    
                    )
                    .onTapGesture {
                        onProductPressed(product: product)
                    }
                }
            })
        }
        .foregroundStyle(.netflixWhite)
    }
    
    //MARK: -  Get Data
    private func getData() async {
        guard products.isEmpty else { return }
        do {
            products = try await DataBaseHelper().getProducts()
        } catch {
            print("Error: \(error)")
        }
    }
    
}

import SwiftfulRouting
#Preview {
    RouterView { _ in
        NetflixMovieDetailsView()
    }
}
