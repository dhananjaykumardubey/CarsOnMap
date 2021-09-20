//
//  UIGraphicsImageRenderer+Image.swift
//  CarsOnMap
//
//  Created by Dhananjay Kumar Dubey on 18/9/21.
//

import Foundation
import UIKit
import MapKit

extension UIGraphicsImageRenderer {
    
    static func image(for annotations: [MKAnnotation], in rect: CGRect) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: rect.size)

        let countText = "\(annotations.count)"
        
        return renderer.image { _ in
            UIColor(red: 237 / 255.0, green: 106 / 255.0, blue: 44 / 255.0, alpha: 1.0).setFill()
            UIBezierPath(ovalIn: rect).fill()
            
            let piePath = UIBezierPath()
            piePath.addArc(withCenter: CGPoint(x: 20, y: 20), radius: 20,
                           startAngle: 0, endAngle: (CGFloat.pi * 2.0),
                           clockwise: true)
            piePath.addLine(to: CGPoint(x: 20, y: 20))
            piePath.close()
            piePath.fill()
            
            UIColor.white.setFill()
            UIBezierPath(ovalIn: CGRect(x: 8, y: 8, width: 24, height: 24)).fill()
            
            countText.drawForCluster(in: rect)
        }
    }
}
