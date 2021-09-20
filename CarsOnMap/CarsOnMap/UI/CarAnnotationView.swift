//
//  CarAnnotationView.swift
//  CarsOnMap
//
//  Created by Dhananjay Kumar Dubey on 18/9/21.
//

import Foundation
import MapKit

class CarAnnotationView: MKAnnotationView {
        
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.clusteringIdentifier = "clusterAnnotation"
        self.collisionMode = .circle
        self.image = drawCarAnnotation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawCarAnnotation() -> UIImage? {
        
        guard  #available(iOS 10.0, *) else { return nil }
        
        let imageSize = CGSize(width: 40, height: 40)
        let renderer = UIGraphicsImageRenderer(size: imageSize)
        let image = renderer.image { ctx in
            
            let rect = CGRect(x: 5, y: 5, width: imageSize.width - 10, height: imageSize.height - 10)
            
            ctx.cgContext.setFillColor(UIColor.white.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.white.cgColor)
            ctx.cgContext.setLineWidth(1)
            ctx.cgContext.setShadow(offset: CGSize(width: 0, height: 2), blur: 0.3, color: UIColor.black.withAlphaComponent(0.1).cgColor)
            ctx.cgContext.addEllipse(in: rect)
            ctx.cgContext.drawPath(using: .fillStroke)
            
            ctx.cgContext.setFillColor(UIColor.init(red: 104.0/255.0, green: 59.0/255.0, blue: 57.0/255.0, alpha: 1.0).cgColor)
            ctx.cgContext.addEllipse(in: rect)
            ctx.cgContext.drawPath(using: .fillStroke)
            
            if let vehicleImage = UIImage(named: "sedan")?.resizeImage(CGSize(width: 20.0, height: 20.0)),
               let cgg = vehicleImage.cgImage {
                let size = vehicleImage.size
                let trans = __CGAffineTransformMake(1, 0, 0, -1, 0, size.height)
                ctx.cgContext.concatenate(trans)
                ctx.cgContext.draw(cgg, in: CGRect(x: imageSize.width/2 - size.width/2, y: -(imageSize.height/2 - size.height/2), width: size.width, height: size.height), byTiling: false)
            }
            return
        }
        return image
    }
    
}
