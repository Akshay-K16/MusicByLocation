//
//  ContentView.swift
//  MusicByLocation
//
//  Created by Khemaney, Akshay (SPH) on 13/05/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var state = StateController()
    
    var body: some View {
        Form {
            Text("City: \(state.lastKnownLocation)")
            List(state.artists, id: \.self) {
                item in
                Link("\(item.name)", destination: URL(string: "\(item.url)")!)
            }
            Button("Find Music", action: {
                state.findMusic()
            })
            
        }.onAppear(perform: {
            state.requestAccessToLocationData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
