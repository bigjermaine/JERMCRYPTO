//
//  JERMCRYPTOApp.swift
//  JERMCRYPTO
//
//  Created by Apple on 20/10/2022.
//

import SwiftUI

@main
struct JERMCRYPTOApp: App {
    @StateObject var  homeViewModel = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor :UIColor(Color.blue)]
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView().navigationBarHidden(true)
                
            }
            .environmentObject(homeViewModel)
        }
    }
}
