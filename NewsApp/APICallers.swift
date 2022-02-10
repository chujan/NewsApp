//
//  APICallers.swift
//  NewsApp
//
//  Created by Chukwuemeka Jennifer on 06/01/2022.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    
    struct Constants {
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2021-12-06&sortBy=publishedAt&apiKey=14d7faa62abb49ceaf7f085fb25cdf5f")
        static let searchUrlString = "https://newsapi.org/v2/everything?from=2022-01-05&to=2022-01-05&sortBy=popularity&apiKey=14d7faa62abb49ceaf7f085fb25cdf5f&q="
        static let catagoryUrlString = "https://newsapi.org/v2/top-headlines?country=US&category=business&apiKey=14d7faa62abb49ceaf7f085fb25cdf5f&q"
    }
    
    private init() {}
    
    public func getTopStories(completion: @escaping  (Result<[Article], Error>)-> Void) {
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                    
                }
                catch {
                    
                        completion(.failure(error))
                    }
                }
               
            }
          task.resume()
        
            
        }
    
    
    public func search(with query: String, completion:@escaping  (Result<[Article], Error>)-> Void) {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        let urlString = Constants.searchUrlString + query
        guard let url =  URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                    
                }
                catch {
                    
                    completion(.failure(error))
                }
            }
            
        }
        task.resume()
        
        
    }
    
    public func category(with query: String, completion:@escaping  (Result<[Article], Error>)-> Void) {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        let urlString = Constants.catagoryUrlString + query
        guard let url =  URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                    
                }
                catch {
                    
                        completion(.failure(error))
                    }
                }
               
            }
          task.resume()
    
        
    }
    
}
