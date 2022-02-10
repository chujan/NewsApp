//
//  APIResponse.swift
//  NewsApp
//
//  Created by Chukwuemeka Jennifer on 06/01/2022.
//

import Foundation

struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
}
struct Source: Codable {
    let name: String
}
