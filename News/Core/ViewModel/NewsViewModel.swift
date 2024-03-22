//
//  NewsViewModel.swift
//  News
//
//  Created by Benji Loya on 22.03.2024.
//

import SwiftUI
import Combine

class NewsViewModel: ObservableObject {
    @Published var news: [News] = []
}

