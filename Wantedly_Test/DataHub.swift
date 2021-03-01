//
//  gerData.swift
//  Wantedly_Test
//
//  Created by Bofan Yang on 2021/02/27.
//

import Foundation
import Combine
import SwiftUI




class dataPublisher: ObservableObject {
    
//    let urlString = "https://www.wantedly.com/api/v1/projects?q=swift&page=1"
    var urlString:String
    @Published var openJobs = [jobData]()
    
    init(url: String) {
        urlString = url
        getJobs()
    }
    
    func getJobs(){
        if let url = URL(string: urlString){
            if let data = try? Data(contentsOf: url){
                print("Data package retrived")
                decode(json: data)
            }
        }
    }
    
    func decode(json: Data){
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(Results.self, from: json)
            openJobs = decoded.data
            print(openJobs[0].description)
        } catch {
            print("Error happened: \(error)")
        }
    }
}







