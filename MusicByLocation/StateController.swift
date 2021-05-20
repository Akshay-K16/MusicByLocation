//
//  StateController.swift
//  MusicByLocation
//
//  Created by Khemaney, Akshay (SPH) on 17/05/2021.
//

import Foundation

class StateController: ObservableObject {
    let locationHandler = LocationHandler()
    let itunesAdaptor = ITunesAdaptor()
    @Published var artists: [Artist] = []
    var lastKnownLocation : String = "" {
        didSet {
            itunesAdaptor.getArtists(lastKnownLocation, completion: updateArtists)
        }
    }

    func findMusic() {
        locationHandler.requestLocation()
    }
    
    func requestAccessToLocationData() {
        locationHandler.stateController = self
        locationHandler.requestAuthorisation()
    }
    
    func updateArtists(x: [Artist]?) {
        if let test = x {
            print(test[0].url)
        }
        DispatchQueue.main.async {
            self.artists = x ?? [Artist(name: "No Artists Found", url: "https://www.google.co.uk/")]
        }
    }
}
