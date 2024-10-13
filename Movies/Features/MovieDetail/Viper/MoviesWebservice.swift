//
//  Webservice.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//


import Foundation

class MoviesWebservice {
//    func getNewsData(completion: @escaping (Result<News, Error>) -> Void) {
//        let newsURL = "https://....."
//        guard let url = URL(string: newsURL) else { return }
//        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                completion(.failure(error))
//                print("DataTask error: \(error.localizedDescription)")
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse else {
//                print("News Response")
//                return
//            }
//            print("Response status code: \(response.statusCode)")
//            
//            guard let data = data else {
//                print("News Data")
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                let jsonData = try decoder.decode(News.self, from: data)
//                DispatchQueue.main.async {
//                    completion(.success(jsonData))
//                }
//            } catch let error {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
}
