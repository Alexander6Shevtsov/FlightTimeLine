//
//  ContentView.swift
//  FlightTimeLine
//
//  Created by Alexander Shevtsov on 09.04.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView { // TabBar
            HomeScreenView()
                .tabItem { // иконка TabBar
                    Image(systemName: "airplane") // изображение
                    Text("Home") // текст иконки
                    
                }
            
            UserProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    ContentView()
}
