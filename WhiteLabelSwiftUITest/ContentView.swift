//
//  ContentView.swift
//  WhiteLabelSwiftUITest
//
//  Created by Lehnherr Reto on 22.04.21.
//

import SwiftUI

struct ContentView: View {
    var bundleName: String {
        Bundle.main.bundleIdentifier!
    }
    
    static var client: Whitelabelable {
        Client()
    }
    var body: some View {
        ZStack {
            Text(ContentView.client.name)
                .padding()
                .background(Color.black.opacity(0.5))
                .foregroundColor(Color(ContentView.client.tintColor))
        }.frame(
            maxWidth: .infinity,
            maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Image("mood")
                        .resizable()
                        .scaledToFill())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
