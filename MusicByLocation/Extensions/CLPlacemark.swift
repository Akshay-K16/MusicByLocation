//
//  CLPlacemark.swift
//  MusicByLocation
//
//  Created by Khemaney, Akshay (SPH) on 17/05/2021.
//

import Foundation
import CoreLocation

extension CLPlacemark {
    func getLocationDetails() -> [String] {
        return ["\(self.thoroughfare ?? "None")", "\(self.locality ?? "None")", "\(self.country ?? "None")", "\(self.postalCode ?? "None")"]
    }
}

