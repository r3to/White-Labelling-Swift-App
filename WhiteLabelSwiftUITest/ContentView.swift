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
    var body: some View {
        ZStack {
            
//                .resizable()
//                .edgesIgnoringSafeArea(.all)
////                .frame(maxWidth: .infinity,
////                       maxHeight: .infinity)
//                .scaledToFill()
            Text(bundleName)
                .padding()
                .background(Color.black.opacity(0.5))
                .foregroundColor(.white)
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
