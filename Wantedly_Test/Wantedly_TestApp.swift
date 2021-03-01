//
//  Wantedly_TestApp.swift
//  Wantedly_Test
//
//  Created by Bofan Yang on 2021/02/27.
//

import SwiftUI
import Combine
import Foundation

@main
struct Wantedly_TestApp: App {
    
    let urlString = "https://www.wantedly.com/api/v1/projects?q=swift&page=1"

    
    init() {
        if let url = URL(string: urlString){
            if let data = try? Data(contentsOf: url){
                print("Data package retrived")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
}


