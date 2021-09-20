//
//  ClusterAnnotationView.swift
//  CarsOnMap
//
//  Created by Dhananjay Kumar Dubey on 18/9/21.
//

import Foundation
import UIKit
import MapKit

final class ClusterAnnotationView: MKAnnotationView {    
    override var annotation: MKAnnotation? {
        didSet {
            guard let cluster = annotation as? MKClusterAnnotation else { return }
            displayPriority = .defaultHigh
            self.clusteringIdentifier = "clusterAnnotation"
            let rect = CGRect(x: 0, y: 0, width: 40, height: 40)
            image = UIGraphicsImageRenderer.image(for: cluster.memberAnnotations, in: rect)
        }
    }
}
