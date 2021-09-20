//
//  MapItem.swift
//  CarsOnMap
//
//  Created by Dhananjay Kumar Dubey on 18/9/21.
//

import Foundation
import MapKit

/// MapItem consisting coordinates, imageUrl, and timeStamp
/// Can be expanded to have any other items - like custom annotation image, if needed
/// Can be expanded to have variants of images, if cluster supports come in different images required, based on some condition
class MapItem: NSObject, MKAnnotation {
    
    let image: Image?
    let coordinate: CLLocationCoordinate2D

    init(coordinate: CLLocationCoordinate2D, image: Image?) {
        
        self.coordinate = coordinate
        self.image = image
    }
}
