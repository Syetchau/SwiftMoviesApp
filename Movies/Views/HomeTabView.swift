//
//  HomeTabView.swift
//  Movies
//
//  Created by LiewSyetChau on 11/1/22.
//

import SwiftUI

struct HomeTabView: View {
    
    enum Tab: Int {
        case movie
        case discover
    }
    
    @State private var selectedTab = Tab.movie
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MoviesView().tabItem {
                tabbarItem(text: "Movies", image: "film")
            }.tag(Tab.movie)
            
            DiscoverView().tabItem {
                tabbarItem(text: "Discover", image: "square.stack")
            }.tag(Tab.discover)
        }
    }
    
    private func tabbarItem(text: String, image: String) -> some View {
        
        VStack {
            Image(systemName: image).imageScale(.large)
            
            Text(text)
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
