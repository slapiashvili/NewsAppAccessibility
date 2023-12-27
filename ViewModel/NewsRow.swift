//
//  NewsRow.swift
//  AccessibleNews
//
//  Created by Salome Lapiashvili on 28.12.23.
//

import SwiftUI

struct NewsRow: View {
    // MARK: - Properties
    let newsItem: NewsItem
    let textSize: CGFloat

    // MARK: - Subviews
    private var titleText: Text {
        Text(newsItem.title)
            .font(.system(size: textSize))
            .fontWeight(.bold)
    }

    private var snippetText: Text {
        Text(newsItem.snippet)
            .font(.system(size: textSize))
            .foregroundColor(.gray)
    }

    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            titleText
            snippetText
        }
    }
}



