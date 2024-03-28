//
//  GetDataView.swift
//  News
//
//  Created by Benji Loya on 28.03.2024.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct GetDataView: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 5) {
                ForEach(users) { user in
                    Text(user.firstName)
                }
            }
            
            VStack(spacing: 5) {
                ForEach(products) { product in
                    Text(product.title)
                }
            }
            .foregroundColor(.gray)
            .padding(.top)
        }
        .padding()
        .onAppear {
            async {
                if #available(iOS 15.0, *) {
                    await getData()
                } else {
                    await getDataCompat()
                }
            }
        }
    }
    
    @available(iOS 15.0, *)
        private func getData() async {
            do {
                users = try await DataBaseHelper().getUsers()
                products = try await DataBaseHelper().getProducts()
            } catch {
                print("Error: \(error)")
            }
        }
        
        // For iOS 14 compatibility
        private func getDataCompat() async {
            do {
                users = try await DataBaseHelper().getUsers()
                products = try await DataBaseHelper().getProducts()
            } catch {
                print("Error: \(error)")
            }
        }
    
}

#Preview {
    GetDataView()
}


/*
 private func getData() async {
        do {
            users = try await DataBaseHelper().getUsers()
            products = try await DataBaseHelper().getProducts()
        } catch {
 print("Error: \(error)")
        }
    }
 */
