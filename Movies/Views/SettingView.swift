//
//  SettingView.swift
//  Movies
//
//  Created by LiewSyetChau on 11/1/22.
//

import SwiftUI

struct SettingView: View {
    
    @Binding var isPresented: Bool
    
    @State private var selection = 1
    @State private var email = ""
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $selection,
                       label: Text("Favourite Genre")) {
                    
                    Text("Action").tag(1)
                    
                    Text("Comedy").tag(2)
                    
                    Text("Horror").tag(3)
                    
                    Text("Science Friction").tag(4)
                }
                
                Section(header: Text("Email")) {
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button {
                    isPresented.toggle()
                } label: {
                    Text("Save")
                }
            }
        }.navigationTitle("Settings")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(isPresented: Binding<Bool>.constant(false))
    }
}
