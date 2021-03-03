//
//  ContentView.swift
//  Wantedly_Test
//
//  Created by Bofan Yang on 2021/02/27.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            MainView().tabItem{
                Image(systemName: "doc.richtext.fill")
                Text("Main")
            }
            DummyView1().tabItem{
                Image(systemName: "heart.text.square.fill")
                Text("Dummy1")
            }
            
            DummyView2().tabItem{
                Image(systemName: "person.crop.circle")
                Text("Dummy2")
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
