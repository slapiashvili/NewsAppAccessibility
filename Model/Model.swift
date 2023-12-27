//
//  Model.swift
//  AccessibleNews
//
//  Created by Salome Lapiashvili on 28.12.23.
//


import SwiftUI

struct NewsItem: Identifiable, Decodable {
    let uuid: String
    let title: String
    let snippet: String
    let url: String
    var id: String { uuid }
}

struct NewsApiResponse: Decodable {
    let meta: Meta
    let data: [NewsItem]
}

struct Meta: Decodable {
    let found: Int
    let returned: Int
    let limit: Int
    let page: Int
}
