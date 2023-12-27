//
//  NewsDetail.swift
//  AccessibleNews
//
//  Created by Salome Lapiashvili on 28.12.23.
//

import SwiftUI

struct NewsDetail: View {
    //MARK: -properties:
    let newsItem: NewsItem

    private var newsDetailContent: some View {
        VStack {
            Text(newsItem.title)
                .font(.title)
            Text(newsItem.snippet)
                .font(.body)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding()
    }
//MARK: -body:
    var body: some View {
        newsDetailContent
            .navigationBarTitle("News Detail")
    }
}

