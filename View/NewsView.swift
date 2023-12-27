//
//  NewsVieww.swift
//  AccessibleNews
//
//  Created by Salome Lapiashvili on 28.12.23.
//

import SwiftUI


struct NewsView: View {
    @StateObject private var viewModel = NewsViewModel()
    
//MARK: -private properties:
    private var adjustSizeSection: some View {
        HStack {
            Spacer()
            Text("Adjust Size")
                .font(.caption)
                .accessibilityLabel("Slide left or right to adjust text size")

            Slider(value: $viewModel.textSize, in: 12...36, step: 1)
                .padding()
        }
    }

    private var newsListSection: some View {
        List(viewModel.newsItems, id: \.id) { item in
            NavigationLink(destination: NewsDetail(newsItem: item)) {
                NewsRow(newsItem: item, textSize: viewModel.textSize)
                    .accessibilityLabel("\(item.title), \(item.snippet)")
            }
            .accessibilityLabel("you may navigate to your news from here")
        }
        .navigationBarTitle("Accessible News")
        .accessibilityAddTraits(.isHeader)
        .accessibilityLabel("welcome to Accessible News")
        .navigationBarTitleDisplayMode(.inline)
        .font(.headline)
        .onAppear {
            viewModel.fetchData()
        }
    }
//MARK: -body
    var body: some View {
        NavigationView {
            VStack {
                adjustSizeSection
                newsListSection
            }
            .accessibilityLabel("News List")
        }
        .environment(\.sizeCategory, .extraExtraExtraLarge)
    }
}

//MARK: -preview:
#Preview {
    NewsView()
}

