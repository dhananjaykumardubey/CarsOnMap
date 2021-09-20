//
//  CLLocationCoordinate2D+Equatable.swift
//  CarsOnMap
//
//  Created by Dhananjay Kumar Dubey on 18/9/21.
//

import Foundation

import Foundation
import CoreLocation.CLLocation

extension CLLocationCoordinate2D: Equatable {
   public static func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude &&
            lhs.longitude == rhs.latitude
    }
}
