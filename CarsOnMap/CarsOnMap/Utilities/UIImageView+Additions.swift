//
//  UIImageView+Additions.swift
//  CarsOnMap
//
//  Created by Dhananjay Kumar Dubey on 20/9/21.
//

import UIKit

 extension UIImageView {
  func generateNameIntials(from nameInitials: String) {
    let imageSize = self.frame.size
    let renderer = UIGraphicsImageRenderer(size: imageSize)
    let image = renderer.image { ctx in
      let rect = CGRect(x: 5, y: 5, width: imageSize.width - 10, height: imageSize.height)
      ctx.cgContext.setFillColor(UIColor.black.cgColor)
      ctx.cgContext.setStrokeColor(UIColor.gray.cgColor)
      ctx.cgContext.setLineWidth(3)
      ctx.cgContext.addEllipse(in: rect)
      ctx.cgContext.drawPath(using: .fillStroke)

      let attributes = [
        NSAttributedString.Key.foregroundColor: UIColor.darkGray,
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 35.0)
      ]

      let size = nameInitials.uppercased().size(withAttributes: attributes)

      let textRect = CGRect(x: imageSize.width / 2 - size.width / 2, y: imageSize.height / 2 - size.height / 2, width: size.width, height: size.height)
      nameInitials.draw(in: textRect, withAttributes: attributes)
    }
    self.image = image
  }
}
