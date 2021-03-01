//
//  ContentView.swift
//  Wantedly_Test
//
//  Created by Bofan Yang on 2021/02/27.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var publisher = dataPublisher(url: "https://www.wantedly.com/api/v1/projects?q=swift&page=1")
    
    var body: some View {
        ForEach(publisher.openJobs){each in
            Text(each.title).padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
