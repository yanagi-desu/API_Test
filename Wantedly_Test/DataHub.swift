//
//  gerData.swift
//  Wantedly_Test
//
//  Created by Bofan Yang on 2021/02/27.
//

import Foundation
import Combine
import SwiftUI



//struct  FromServer: Decodable {
//    var id: Int
//    var title: String
//    var published_at: String
//    var candidate_count: Int
//
//}
func parse(json: Data){
    var jobOpen : [jobData]
    let decoder = JSONDecoder()
    if let jsonDecoded = try? decoder.decode(Results.self, from: json){
        jobOpen = jsonDecoded.data
        print(jobOpen)
    }
}

//func loadJson(fromURLString urlString: String,
//                      completion: @escaping(Result<Data,Error>) -> Void){
//    if let url = URL(string: urlString){
//        let urlSession = URLSession(configuration: .default).dataTask(with: url){(data, response, error) in
//            if let error = error{
//                completion(.failure(error))
//            }
//
//            if let data = data {
//                print(data)
//                completion(.success(data))
//            }
//        }
//        urlSession.resume()
//    }
//}



