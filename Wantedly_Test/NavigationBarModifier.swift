//
//  NavigationBarModifier.swift
//  Cornucopia
//
//  Created by Bofan Yang on 2020/12/14.
//

//Created with refrence to
///(https://medium.com/swlh/custom-navigationview-bar-in-swiftui-4b782eb68e94)
import SwiftUI
import UIKit


struct NavigationBarColor: ViewModifier{
    
    init(backgroundColor: UIColor, tintColor: UIColor, scrollColor: UIColor){
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: tintColor]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: tintColor]
        
        
        let scrollAppearance = UINavigationBarAppearance()
        scrollAppearance.configureWithOpaqueBackground()
        scrollAppearance.backgroundColor = scrollColor
        scrollAppearance.titleTextAttributes = [.foregroundColor: tintColor]
        scrollAppearance.largeTitleTextAttributes = [.foregroundColor: tintColor]
        
        UINavigationBar.appearance().standardAppearance = scrollAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = scrollAppearance
        UINavigationBar.appearance().tintColor = tintColor
    }
    
    func body(content: Content) -> some View {
        content
    }
}




extension View{
    func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor, scrollEdgeColor: UIColor) -> some View{
        modifier(NavigationBarColor(backgroundColor: backgroundColor, tintColor: tintColor, scrollColor: scrollEdgeColor))
    }
}
