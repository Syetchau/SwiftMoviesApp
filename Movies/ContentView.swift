//
//  ContentView.swift
//  Movies
//
//  Created by LiewSyetChau on 11/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSetting = false
    
    var body: some View {
        NavigationView {
            Group {
                HomeTabView()
            }.navigationBarTitle("Movies", displayMode: .automatic)
                .navigationBarItems(trailing: HStack{
                    settingButton
                })
                .sheet(isPresented: $showSetting, content: {
                    SettingView(isPresented: $showSetting)
                })
        }
    }
    
    private var settingButton: some View {
        Button {
            showSetting.toggle()
        } label: {
            HStack {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .foregroundColor(.gray)
            }.frame(width: 30, height: 30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
