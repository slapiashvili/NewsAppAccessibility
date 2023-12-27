//
//  ViewModel.swift
//  AccessibleNews
//
//  Created by Salome Lapiashvili on 28.12.23.
//

import SwiftUI

class NewsViewModel: ObservableObject {
    @Published var newsItems: [NewsItem] = []
    @Published var textSize: CGFloat = 17.0
//MARK: -method for fetching data:
    func fetchData() {
        NetworkService.shared.fetchData { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.newsItems = response.data
                }
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
}

